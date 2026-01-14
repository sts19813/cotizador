<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\BaseImage;
use App\Models\ProductFachadaRender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Http;
use Illuminate\Http\Client\RequestException;

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
                $q->orderBy('fachada_7_price', 'asc');
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

        $stageId = 19; // Piaro   


        $map = [];

        try {
            $response = Http::timeout(5) // segundos
                ->get(
                    config('services.naboo.url') . 'api/masterplan/map',
                    ['stage_id' => $stageId]
                );

            if ($response->successful()) {
                $map = $response->json();
            }

        } catch (\Throwable $e) {
            // Log opcional
            logger()->warning('Naboo map no disponible', [
                'error' => $e->getMessage(),
            ]);

            $map = []; // fallback seguro
        }


        return view('test', compact('categories', 'style', 'baseImages', 'fachadas', 'rendersPorProducto', 'map'));
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
