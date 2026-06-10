<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $user = Auth::user();
        if (! $user || ! $user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }

        $products = Product::with('category')->latest()->get();
        $categories = Category::all();

        return view('admin.products', compact('products', 'categories'));
    }

    public function showByStyle($style)
    {
        $validStyles = ['Minimalista', 'Tulum', 'Mexicano'];

        if (! in_array($style, $validStyles)) {
            abort(404);
        }

        $products = Product::with('category')
            ->where('style', $style)
            ->whereDoesntHave('category', function ($q) {
                $q->where('name', 'LIKE', '%Fachada%');
            })
            ->get();

        return view('admin.prices.index', compact('products', 'style'));
    }

    public function updateMassPrices(Request $request, $style)
    {
        $productsData = $request->input('products', []);

        foreach ($productsData as $id => $prices) {
            $product = Product::find($id);
            if ($product) {
                $product->update($prices);
            }
        }

        return redirect()->route('admin.products.prices.byStyle', $style)
            ->with('success', 'Precios actualizados correctamente.');
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

        $data = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
            'pre_code' => 'required',
            'variant_code' => 'required',
            'version' => 'required',
            'title' => 'required',
            'description' => 'nullable',
            'brand' => 'nullable|string',
            'base_price' => 'required|numeric',
            'image_file' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'product_file' => 'nullable|file|max:4096',
            // ✅ Validación de fachadas
            'fachada_1_price' => 'required|numeric',
            'fachada_2_price' => 'required|numeric',
            'fachada_3_price' => 'required|numeric',
            'fachada_4_price' => 'required|numeric',
            'fachada_5_price' => 'required|numeric',
            'fachada_6_price' => 'required|numeric',
            'fachada_7_price' => 'required|numeric',
        ]);

        $data['is_visible'] = true;
        $data['brand'] = $data['brand'] ?? '';

        // Guardar archivos si existen
        if ($request->hasFile('image_file')) {
            $data['image_url'] = $this->storePublicFile($request, 'image_file');
        }

        if ($request->hasFile('product_file')) {
            $data['product_url'] = $this->storePublicFile($request, 'product_file');
        }

        unset($data['image_file'], $data['product_file']);

        Product::create($data);

        return redirect()->route('admin.products.index')->with('success', 'Producto creado correctamente.');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Product $product)
    {
        $user = Auth::user();
        if (! $user || ! $user->isAdmin()) {
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
        $data = $request->validate([
            'category_id' => 'required|exists:categories,id',
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
            'pre_code' => 'required',
            'variant_code' => 'required',
            'version' => 'required',
            'title' => 'required',
            'description' => 'nullable',
            'brand' => 'nullable|string',
            'base_price' => 'required|numeric',
            'image_file' => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'product_file' => 'nullable|file|max:4096',
        ]);

        $data['is_visible'] = $request->has('is_visible');
        $data['brand'] = $data['brand'] ?? '';

        // Guardar archivos si existen
        if ($request->hasFile('image_file')) {
            $data['image_url'] = $this->storePublicFile($request, 'image_file');
        }

        if ($request->hasFile('product_file')) {
            $data['product_url'] = $this->storePublicFile($request, 'product_file');
        }

        unset($data['image_file'], $data['product_file']);

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

    private function storePublicFile(Request $request, string $inputName): string
    {
        $file = $request->file($inputName);
        $filename = time().'_'.basename($file->getClientOriginalName());

        return $file->storeAs('producto', $filename, 'public');
    }
}
