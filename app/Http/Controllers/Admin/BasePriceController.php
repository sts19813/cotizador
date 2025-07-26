<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BasePrice;

class BasePriceController extends Controller
{
    public function index()
    {
        $basePrices = BasePrice::all();
        return view('admin.base_prices.index', compact('basePrices'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'style' => 'required|in:Minimalista,Tulum,Mexicano|unique:base_prices,style',
            'price' => 'required|numeric',
            'image_url' => 'nullable|url',
        ]);

        BasePrice::create($request->all());

        return redirect()->back()->with('success', 'Precio base creado.');
    }

    public function update(Request $request, BasePrice $basePrice)
    {
        $request->validate([
            'style' => 'required|in:Minimalista,Tulum,Mexicano',
            'price' => 'required|numeric',
            'image_url' => 'nullable|url',
        ]);
    
        $basePrice->update($request->only('style', 'price', 'image_url'));
    
        return redirect()->back()->with('success', 'Precio base actualizado correctamente.');
    }

    public function destroy(BasePrice $basePrice)
    {
        $basePrice->delete();

        return redirect()->back()->with('success', 'Precio base eliminado.');
    }
}
