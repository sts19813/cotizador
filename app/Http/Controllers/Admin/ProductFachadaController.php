<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;

class ProductFachadaController extends Controller
{
    //pagina para la configuracion de precios base
    public function index()
    {
        $products = Product::where('title', 'LIKE', '%fachada%')
            ->orderBy('id', 'DESC')
            ->get();

        return view('admin.products.fachadas.index', compact('products'));
    }
    
    //actualiza el precio base de una fachada
    public function update(Request $request, Product $product)
    {
        $request->validate([
            'base_price' => 'required|numeric|min:0'
        ]);

        $product->update([
            'base_price' => $request->base_price
        ]);
        return redirect()->back()->with('success', 'Precio actualizado correctamente.');
    }
}
