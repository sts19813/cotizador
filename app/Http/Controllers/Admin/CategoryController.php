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
            'products.renders'
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



        return view('test', compact('categories', 'style', 'baseImages', 'fachadas', 'rendersPorProducto'));
    }

    // Vista previa de configuración compartida
    public function showPreview($style, $token)
    {
        $config = Configuration::where('token', $token)->firstOrFail();

        // usar style de URL o fallback al guardado
        $style = ucfirst($style);

        return $this->configurador($style)
            ->with('sharedConfig', $config->data);
    }

    // Vista previa de configuración sin estilo (si se accede desde /config/{token})
    public function showPreviewSimple($token)
    {
        $config = Configuration::where('token', $token)->firstOrFail();

        $style = $config->data['style'] ?? 'Minimalista';

        return $this->configurador($style)
            ->with('sharedConfig', $config->data);
    }


    // Guardar configuración compartida y generar token
    public function storePreview(Request $request)
    {
        $data = $request->input('data');

        $token = Str::random(8); // corto

        Configuration::create([
            'token' => $token,
            'data' => $data
        ]);

        return response()->json([
            'url' => url("/" . strtolower($data['style']) . "/config/$token")
        ]);
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
