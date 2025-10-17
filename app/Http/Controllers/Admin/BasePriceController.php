<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BasePrice;

class BasePriceController extends Controller
{


    public function showByStyle($style)
    {
        $validStyles = ['Minimalista', 'Tulum', 'Mexicano'];

        if (!in_array($style, $validStyles)) {
            abort(404);
        }

        $products = \App\Models\Product::where('style', $style)->get();

        return view('admin.prices.index', compact('products', 'style'));
    }

}
