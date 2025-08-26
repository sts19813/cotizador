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
            'title' => 'required',
            'description' => 'nullable',
            'brand' => 'required',
            'base_price' => 'required|numeric',
            'image_url' => 'nullable',
            'product_url' => 'nullable',
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
            'title' => 'required',
            'description' => 'nullable',
            'base_price' => 'required|numeric',
            'one_bedroom_price' => 'required|numeric',
            'two_bedroom_price' => 'required|numeric',
            'three_bedroom_price' => 'required|numeric',
            'four_bedroom_price' => 'required|numeric',
            'image_file' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'product_file' => 'nullable|file|max:4096', // puedes ajustar según tipo
        ]);

        $data = $request->all();

        $data['brand'] = $data['brand'] ?? '';

        if ($request->hasFile('image_file')) {
            $filename = time() . '_' . $request->file('image_file')->getClientOriginalName();
            $request->file('image_file')->move(public_path('producto'), $filename);
            $data['image_url'] = 'producto/' . $filename;
        }

        if ($request->hasFile('product_file')) {
            $filename = time() . '_' . $request->file('product_file')->getClientOriginalName();
            $request->file('product_file')->move(public_path('producto'), $filename);
            $data['product_url'] = 'producto/' . $filename;
        }

        $product->update($data);

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
