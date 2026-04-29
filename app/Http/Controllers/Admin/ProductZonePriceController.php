<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductZonePrice;
use App\Models\Zone;
use Illuminate\Http\Request;

class ProductZonePriceController extends Controller
{
    private const VALID_STYLES = ['Minimalista', 'Tulum', 'Mexicano'];

    public function showByZoneAndStyle(int $zone, string $style = 'Minimalista')
    {
        $zoneModel = Zone::findOrFail($zone);
        $this->ensureValidStyle($style);

        $products = Product::with('category')
            ->where('style', $style)
            ->whereDoesntHave('category', function ($query) {
                $query->where('name', 'LIKE', '%Fachada%');
            })
            ->get();

        $overrides = ProductZonePrice::where('zone_id', $zoneModel->id)
            ->whereIn('product_id', $products->pluck('id'))
            ->get()
            ->keyBy('product_id');

        return view('admin.prices.zone', [
            'products' => $products,
            'style' => $style,
            'styles' => self::VALID_STYLES,
            'zone' => $zoneModel->id,
            'zones' => Zone::orderBy('order')->orderBy('name')->get(),
            'zoneName' => $zoneModel->name,
            'overrides' => $overrides,
        ]);
    }

    public function updateMassPrices(Request $request, int $zone, string $style)
    {
        $zoneModel = Zone::findOrFail($zone);
        $this->ensureValidStyle($style);

        $rules = ['products' => 'array'];
        for ($i = 1; $i <= 7; $i++) {
            $rules["products.*.fachada_{$i}_price"] = 'nullable|numeric|min:0';
        }
        $validated = $request->validate($rules);

        $productsData = $validated['products'] ?? [];

        foreach ($productsData as $productId => $prices) {
            $product = Product::where('style', $style)->find($productId);
            if (!$product) {
                continue;
            }

            $payload = [];
            for ($i = 1; $i <= 7; $i++) {
                $key = "fachada_{$i}_price";
                $fallback = (float) $product->{$key};
                $payload[$key] = isset($prices[$key]) ? round((float) $prices[$key], 2) : $fallback;
            }

            if ($this->isSameAsFallback($product, $payload)) {
                ProductZonePrice::where('product_id', $product->id)
                    ->where('zone_id', $zoneModel->id)
                    ->delete();
                continue;
            }

            ProductZonePrice::updateOrCreate(
                [
                    'product_id' => $product->id,
                    'zone_id' => $zoneModel->id,
                ],
                $payload
            );
        }

        return redirect()
            ->route('admin.products.zone-prices.byStyle', [$zoneModel->id, $style])
            ->with('success', 'Precios por zona actualizados correctamente.');
    }

    private function ensureValidStyle(string $style): void
    {
        if (!in_array($style, self::VALID_STYLES, true)) {
            abort(404);
        }
    }

    private function isSameAsFallback(Product $product, array $payload): bool
    {
        for ($i = 1; $i <= 7; $i++) {
            $key = "fachada_{$i}_price";
            $payloadValue = number_format((float) $payload[$key], 2, '.', '');
            $fallbackValue = number_format((float) $product->{$key}, 2, '.', '');

            if ($payloadValue !== $fallbackValue) {
                return false;
            }
        }

        return true;
    }
}
