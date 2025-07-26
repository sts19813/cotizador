<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Category;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();

        if (!$user || !$user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }
    
        $products = Product::with('category')->latest()->get();
        $categories = Category::all();
    
        return view('admin.products', compact('products', 'categories'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required|exists:categories,id',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
            'pre_code' => 'required',
            'variant_code' => 'required',
            'version' => 'required',
            'description' => 'required',
            'brand' => 'required',
            'base_price' => 'required|numeric',
            'image_url' => 'nullable|url',
            'product_url' => 'nullable|url',
            'one_bedroom_price' => 'required|numeric',
            'two_bedroom_price' => 'required|numeric',
            'three_bedroom_price' => 'required|numeric',
            'four_bedroom_price' => 'required|numeric',
        ]);

        Product::create($request->all());

        return redirect()->route('admin.products.index')->with('success', 'Producto creado correctamente.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $user = Auth::user();
        if (!$user || !$user->isAdmin()) {
            abort(403);
        }
    
        $categories = Category::all();
    
        return view('admin.products.edit', compact('product', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'category_id' => 'required|exists:categories,id',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
            'pre_code' => 'required',
            'variant_code' => 'required',
            'version' => 'required',
            'description' => 'required',
            'brand' => 'required',
            'base_price' => 'required|numeric',
            'image_url' => 'nullable|url',
            'product_url' => 'nullable|url',
            'one_bedroom_price' => 'required|numeric',
            'two_bedroom_price' => 'required|numeric',
            'three_bedroom_price' => 'required|numeric',
            'four_bedroom_price' => 'required|numeric',
        ]);
    
        $product->update($request->all());
    
        return redirect()->route('admin.products.index')->with('success', 'Producto actualizado correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return redirect()->route('admin.products.index')->with('success', 'Producto eliminado correctamente.');
    }

   
}
