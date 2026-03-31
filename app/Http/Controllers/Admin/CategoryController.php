<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\BaseImage;
use App\Models\ProductFachadaRender;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Http;

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

        $categories = Category::with([
            'products' => function ($q) {
                $q->where('is_visible', true)
                    ->orderBy('fachada_7_price', 'asc');
            },
            'products.renders'
        ])
            ->where('is_active', true)
            ->where('style', $style)
            ->orderBy('orden')
            ->get();

        $baseImages = BaseImage::where('style', $style)
            ->orderBy('order')
            ->get();

        $fachadas = ProductFachadaRender::with('product')
            ->whereHas('product', function ($q) use ($style) {
                $q->where('style', $style);
            })
            ->get()
            ->groupBy('product_id')
            ->map(function ($rendersPorProducto) {
                return $rendersPorProducto->keyBy('fachada');
            });

        $rendersPorProducto = $categories->flatMap(function ($category) {
            return $category->products->mapWithKeys(function ($product) {
                $renders = collect($product->renders)->keyBy('id');
                return [$product->id => $renders];
            });
        });

        $developmentTree = [
            [
                'id' => 33,
                'name' => 'Piaro',
                'badge' => 'Entrega inmediata',
                'badge_class' => 'text-primary bg-primary-subtle',
                'children' => [],
            ],
            [
                'id' => 43,
                'name' => 'Paseo Península',
                'badge' => 'Preventa - 20% Enganche',
                'badge_class' => 'text-danger bg-danger-subtle',
                'children' => [],
            ],
            [
                'id' => 3,
                'name' => 'Ahawel',
                'badge' => 'Preventa - 20% Enganche',
                'badge_class' => 'text-danger bg-danger-subtle',
                'children' => [2, 14, 8, 9, 10],
            ],
        ];

        $developmentIds = collect($developmentTree)
            ->flatMap(fn($d) => array_merge([$d['id']], $d['children']))
            ->unique()
            ->values();

        $developments = [];

        foreach ($developmentIds as $developmentId) {
            try {
                $response = Http::timeout(10)
                    ->get(config('services.naboo.url') . "api/desarrollos/{$developmentId}");

                if (!$response->successful()) {
                    continue;
                }

                $development = $response->json();
                $svgInline = null;

                if (!empty($development['svg_image'])) {
                    $svgUrl = rtrim(config('services.naboo.url'), '/') . '/storage/' . ltrim($development['svg_image'], '/');
                    try {
                        $svgResponse = Http::timeout(10)->get($svgUrl);
                        if ($svgResponse->successful()) {
                            $svgInline = $svgResponse->body();
                        }
                    } catch (\Throwable $e) {
                        logger()->warning('No se pudo cargar SVG del desarrollo', [
                            'development_id' => $developmentId,
                            'error' => $e->getMessage(),
                        ]);
                    }
                }

                $developments[$developmentId] = [
                    'id' => $development['id'] ?? $developmentId,
                    'name' => $development['name'] ?? 'Desarrollo',
                    'stage_id' => $development['stage_id'] ?? null,
                    'svg_image' => $development['svg_image'] ?? null,
                    'png_image' => $development['png_image'] ?? null,
                    'map' => $development['map'] ?? [],
                    'lotes' => $development['lotes'] ?? [],
                    'svg_inline' => $svgInline,
                ];
            } catch (\Throwable $e) {
                logger()->warning('Naboo desarrollo no disponible', [
                    'development_id' => $developmentId,
                    'error' => $e->getMessage(),
                ]);
            }
        }

        return view('test', compact(
            'categories',
            'style',
            'baseImages',
            'fachadas',
            'rendersPorProducto',
            'developmentTree',
            'developments'
        ));
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
                Rule::unique('categories')->where(function ($query) use ($request) {
                    return $query->where('style', $request->style);
                })->ignore($category->id),
            ],
            'orden' => 'nullable|integer',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
        ]);

        $validated['is_active'] = $request->has('is_active');

        $category->update($validated);

        return response()->json(['success' => true]);
    }

    public function destroy(Category $category)
    {
        $category->delete();

        return redirect()->route('admin.categories.index')->with('success', 'Categoría eliminada correctamente.');
    }
}
