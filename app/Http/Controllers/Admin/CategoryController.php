<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
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
        $allowedStyles = ['Minimalista', 'Tulum', 'Mexicano'];

        if (!in_array($style, $allowedStyles)) {
            abort(404); // o redirecciona, o usa 'Minimalista'
        }
        
        $categories = Category::with('products')
            ->where('is_active', true)
            ->where('style', $style)
            ->orderBy('orden')
            ->get();
    
        return view('test', compact('categories', 'style'));
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
