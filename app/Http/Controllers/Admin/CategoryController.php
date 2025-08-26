<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\BaseImage;

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
    // Normalizar alias en la URL
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

    // Categorías con productos
    $categories = Category::with('products.renders')
        ->where('is_active', true)
        ->where('style', $style)
        ->orderBy('orden')
        ->get();

    // Imágenes base para el carrusel
    $baseImages = BaseImage::where('style', $style)
        ->orderBy('order')
        ->get();

    return view('test', compact('categories', 'style', 'baseImages'));
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
