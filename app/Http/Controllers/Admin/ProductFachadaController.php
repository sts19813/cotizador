<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductDevelopmentPrice;

class ProductFachadaController extends Controller
{
    private const MAIN_DEVELOPMENTS = [
        33 => 'Piaró',
        43 => 'Paseo Península',
        3 => 'Ahawell',
    ];

    //pagina para la configuracion de precios base
    public function index(Request $request)
    {
        $selectedDevelopment = $request->filled('development')
            ? (int) $request->input('development')
            : null;

        if ($selectedDevelopment !== null && !array_key_exists($selectedDevelopment, self::MAIN_DEVELOPMENTS)) {
            abort(404);
        }

        $products = Product::where('title', 'LIKE', '%fachada%')
            ->with([
                'developmentPrices' => function ($query) use ($selectedDevelopment) {
                    if ($selectedDevelopment === null) {
                        $query->whereRaw('1 = 0');
                        return;
                    }

                    $query->where('development_id', $selectedDevelopment);
                }
            ])
            ->orderBy('id', 'DESC')
            ->get();

        return view('admin.products.fachadas.index', [
            'products' => $products,
            'selectedDevelopment' => $selectedDevelopment,
            'developments' => self::MAIN_DEVELOPMENTS,
        ]);
    }
    
    //actualiza el precio base de una fachada
    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'base_price' => 'required|numeric|min:0',
            'development_id' => 'nullable|integer',
        ]);

        $developmentId = !empty($validated['development_id']) ? (int) $validated['development_id'] : null;

        if ($developmentId !== null && !array_key_exists($developmentId, self::MAIN_DEVELOPMENTS)) {
            abort(404);
        }

        if ($developmentId === null) {
            $product->update([
                'base_price' => $validated['base_price']
            ]);

            return redirect()->back()->with('success', 'Precio base actualizado correctamente.');
        }

        ProductDevelopmentPrice::updateOrCreate(
            [
                'product_id' => $product->id,
                'development_id' => $developmentId,
            ],
            [
                'base_price' => round((float) $validated['base_price'], 2),
            ]
        );

        return redirect()->back()->with('success', 'Precio por desarrollo actualizado correctamente.');
    }
}
