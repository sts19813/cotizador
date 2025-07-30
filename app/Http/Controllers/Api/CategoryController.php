<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;


class CategoryController extends Controller
{
    public function index()
    {
        // Cargar categorías activas con sus productos
        $categories = Category::with('products')
            ->where('is_active', true)
            ->orderBy('orden')
            ->get();

        return response()->json($categories);
    }

    public function show($id)
    {
        $category = Category::with('products')->findOrFail($id);
        return response()->json($category);
    }
}
