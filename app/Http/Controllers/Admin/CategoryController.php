<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\BaseImage;
use App\Models\ProductFachadaRender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CategoryController extends Controller
{
    // Mostrar listado de categorías
    public function index()
    {
        $categories = Category::orderBy('orden')->get();
        return view('admin.categories.index', compact('categories'));
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
    $categories = Category::with(['products.renders'])
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
        $request->validate([
            'name' => 'required|unique:categories,name,' . $category->id,
            'orden' => 'nullable|integer',
        ]);

        $category->update($request->all());

        return redirect()->route('admin.categories.index')->with('success', 'Categoría actualizada correctamente.');
    }

    public function destroy(Category $category)
    {
        $category->delete();

        return redirect()->route('admin.categories.index')->with('success', 'Categoría eliminada correctamente.');
    }
}
