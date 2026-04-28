<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\BaseImage;
use App\Models\ProductFachadaRender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use App\Models\Configuration;
use Illuminate\Support\Str;
use App\Models\Zone;

class CategoryController extends Controller
{
    // Mostrar listado de categorías
    public function index()
    {
        $styles = ['Minimalista', 'Tulum', 'Mexicano'];
        $categoriesByStyle = [];

        foreach ($styles as $style) {
            $categoriesByStyle[$style] = Category::where('style', $style)
                ->orderBy('orden')
                ->get();
        }

        return view('admin.categories.index', compact('categoriesByStyle'));
    }

    public function reorder(Request $request)
    {
        $orderData = $request->input('order', []);

        foreach ($orderData as $index => $id) {
            Category::where('id', $id)->update(['orden' => $index + 1]);
        }

        return response()->json(['success' => true]);
    }
    public function configurador($style = 'Minimalista')
    {
        if ($style === 'home') {
            $style = 'Minimalista';
        } elseif ($style === 'tulum') {
            $style = 'Tulum';
        } elseif ($style === 'mexicano') {
            $style = 'Mexicano';
        }
        $allowedStyles = ['Minimalista', 'Tulum', 'Mexicano'];

        if (!in_array($style, $allowedStyles)) {
            abort(404);
        }

        // Categorías activas con productos y sus renders generales
        $categories = Category::with([
            'products' => function ($q) {
                $q->where('is_visible', true) // 👈 filtro clave
                    ->orderBy('fachada_7_price', 'asc');
            },
            'products.renders',
            'products.zonePrices',
        ])
            ->where('is_active', true)
            ->where('style', $style)
            ->orderBy('orden')
            ->get();

        // Base images (miniaturas del carrusel)
        $baseImages = BaseImage::where('style', $style)
            ->orderBy('order')
            ->get();

        // Fachadas por producto, agrupadas por producto_id y luego por nombre de fachada
        $fachadas = ProductFachadaRender::with('product')
            ->whereHas('product', function ($q) use ($style) {
                $q->where('style', $style);
            })
            ->get()
            ->groupBy('product_id')
            ->map(function ($rendersPorProducto) {
                return $rendersPorProducto->keyBy('fachada'); // ahora es una Collection, keyBy funciona
            });

        // Transforma renders por producto para JSON en Blade
        $rendersPorProducto = $categories->flatMap(function ($category) {
            return $category->products->mapWithKeys(function ($product) {
                // Asegurarnos de que sea Collection antes de usar keyBy
                $renders = collect($product->renders)->keyBy('id');
                return [$product->id => $renders];
            });
        });

        $zones = Zone::with('developments')
            ->where('is_active', true)
            ->orderBy('order')
            ->orderBy('name')
            ->get();

        $zoneDevelopmentMap = $zones
            ->flatMap(function ($zone) {
                return $zone->developments->mapWithKeys(function ($development) use ($zone) {
                    return [(string) $development->development_id => (int) $zone->id];
                });
            })
            ->all();

        $zoneDevelopmentsByZone = $zones
            ->mapWithKeys(function ($zone) {
                $developmentIds = $zone->developments
                    ->pluck('development_id')
                    ->map(fn($id) => (int) $id)
                    ->values()
                    ->all();

                return [(string) $zone->id => $developmentIds];
            })
            ->all();

        $defaultZoneId = $zones->first()?->id;

        return view('test', compact(
            'categories',
            'style',
            'baseImages',
            'fachadas',
            'rendersPorProducto',
            'zones',
            'zoneDevelopmentMap',
            'zoneDevelopmentsByZone',
            'defaultZoneId'
        ));
    }

    // Vista previa de configuración compartida
    public function showPreview($style, $token)
    {
        $config = Configuration::where('token', $token)->firstOrFail();

        // usar style de URL o fallback al guardado
        $style = ucfirst($style);  
        return $this->configurador($style)
            ->with('sharedConfig', $config->data)
            ->with('preview_image', $config->preview_image); 
    }

    // Vista previa de configuración sin estilo (si se accede desde /config/{token})
    public function showPreviewSimple($token)
    {
        $config = Configuration::where('token', $token)->firstOrFail();

        $style = $config->data['style'] ?? 'Minimalista';

        return $this->configurador($style)
            ->with('sharedConfig', $config->data)
            ->with('preview_image', $config->preview_image);
    }


    // Guardar configuración compartida y generar token
    public function storePreview(Request $request)
    {
        $data = $request->input('data');

        $token = Str::random(8);

        $imagePath = null;

        // SI VIENE BASE64 → GUARDAR Y ELIMINAR DEL JSON
        if (!empty($data['preview'])) {
            $imagePath = $this->saveBase64Image($data['preview'], $token);

            unset($data['preview']);
        }

        Configuration::create([
            'token' => $token,
            'data' => $data,
            'preview_image' => $imagePath
        ]);

        return response()->json([
            'url' => url("/" . strtolower($data['style']) . "/config/$token")
        ]);
    }

    //guarda el base 64 de la imagen, devuelve la URL pública
    private function saveBase64Image($base64, $token)
    {
        if (preg_match('/^data:image\/(\w+);base64,/', $base64, $type)) {
            $base64 = substr($base64, strpos($base64, ',') + 1);
        } else {
            return null;
        }

        $base64 = str_replace(' ', '+', $base64);
        $imageData = base64_decode($base64);

        if ($imageData === false) {
            return null;
        }

        $relativePath = "previews/{$token}.jpg"; // sin slash inicial
        $fullPath = public_path($relativePath);

        if (!file_exists(dirname($fullPath))) {
            mkdir(dirname($fullPath), 0775, true);
        }

        file_put_contents($fullPath, $imageData);

        return asset($relativePath);
    }

    public function resumen()
    {

        return view('resumen');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:categories,name',
            'orden' => 'nullable|integer',
        ]);

        Category::create($request->all());

        return redirect()->route('admin.categories.index')->with('success', 'Categoría creada correctamente.');
    }

    public function update(Request $request, Category $category)
    {
        $validated = $request->validate([
            'name' => [
                'required',
                // Unique solo dentro del mismo style, excluyendo la categoría actual
                Rule::unique('categories')->where(function ($query) use ($request) {
                    return $query->where('style', $request->style);
                })->ignore($category->id),
            ],
            'orden' => 'nullable|integer',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
        ]);

        $validated['is_active'] = $request->has('is_active'); // checkbox

        $category->update($validated);

        return response()->json(['success' => true]);
    }

    public function destroy(Category $category)
    {
        $category->delete();

        return redirect()->route('admin.categories.index')->with('success', 'Categoría eliminada correctamente.');
    }
}
