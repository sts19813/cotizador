<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductZonePrice;
use App\Models\Zone;

class ProductFachadaController extends Controller
{
    private const VALID_STYLES = ['Minimalista', 'Tulum', 'Mexicano'];

    public function index(Request $request)
    {
        $selectedStyle = $request->input('style', 'Minimalista');
        if (!in_array($selectedStyle, self::VALID_STYLES, true)) {
            abort(404);
        }

        $selectedZone = $request->filled('zone')
            ? (int) $request->input('zone')
            : null;

        if ($selectedZone !== null && !Zone::whereKey($selectedZone)->exists()) {
            abort(404);
        }

        $products = Product::where('title', 'LIKE', '%fachada%')
            ->where('style', $selectedStyle)
            ->with([
                'zonePrices' => function ($query) use ($selectedZone) {
                    if ($selectedZone === null) {
                        $query->whereRaw('1 = 0');
                        return;
                    }

                    $query->where('zone_id', $selectedZone);
                }
            ])
            ->orderBy('id', 'DESC')
            ->get();

        return view('admin.products.fachadas.index', [
            'products' => $products,
            'selectedZone' => $selectedZone,
            'selectedStyle' => $selectedStyle,
            'styles' => self::VALID_STYLES,
            'zones' => Zone::orderBy('order')->orderBy('name')->get(),
        ]);
    }

    public function update(Request $request, Product $product)
    {
        $validated = $request->validate([
            'base_price' => 'required|numeric|min:0',
            'zone_id' => 'nullable|integer|exists:zones,id',
            'style' => 'nullable|string|in:Minimalista,Tulum,Mexicano',
        ]);

        $zoneId = !empty($validated['zone_id']) ? (int) $validated['zone_id'] : null;

        if ($zoneId === null) {
            $product->update([
                'base_price' => $validated['base_price']
            ]);

            return redirect()
                ->route('admin.precio.fachadas', [
                    'zone' => $zoneId,
                    'style' => $validated['style'] ?? $product->style,
                ])
                ->with('success', 'Precio base actualizado correctamente.');
        }

        ProductZonePrice::updateOrCreate(
            [
                'product_id' => $product->id,
                'zone_id' => $zoneId,
            ],
            [
                'base_price' => round((float) $validated['base_price'], 2),
            ]
        );

        return redirect()
            ->route('admin.precio.fachadas', [
                'zone' => $zoneId,
                'style' => $validated['style'] ?? $product->style,
            ])
            ->with('success', 'Precio por zona actualizado correctamente.');
    }
}
