<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductDevelopmentPrice;
use Illuminate\Http\Request;

class ProductDevelopmentPriceController extends Controller
{
    private const VALID_STYLES = ['Minimalista', 'Tulum', 'Mexicano'];

    private const MAIN_DEVELOPMENTS = [
        33 => 'Piaró',
        43 => 'Paseo Península',
        3 => 'Ahawell',
    ];

    public function showByDevelopmentAndStyle(int $development, string $style = 'Minimalista')
    {
        $this->ensureValidDevelopmentAndStyle($development, $style);

        $products = Product::with('category')
            ->where('style', $style)
            ->whereDoesntHave('category', function ($query) {
                $query->where('name', 'LIKE', '%Fachada%');
            })
            ->get();

        $overrides = ProductDevelopmentPrice::where('development_id', $development)
            ->whereIn('product_id', $products->pluck('id'))
            ->get()
            ->keyBy('product_id');

        return view('admin.prices.development', [
            'products' => $products,
            'style' => $style,
            'styles' => self::VALID_STYLES,
            'development' => $development,
            'developments' => self::MAIN_DEVELOPMENTS,
            'developmentName' => self::MAIN_DEVELOPMENTS[$development],
            'overrides' => $overrides,
        ]);
    }

    public function updateMassPrices(Request $request, int $development, string $style)
    {
        $this->ensureValidDevelopmentAndStyle($development, $style);

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
                ProductDevelopmentPrice::where('product_id', $product->id)
                    ->where('development_id', $development)
                    ->delete();
                continue;
            }

            ProductDevelopmentPrice::updateOrCreate(
                [
                    'product_id' => $product->id,
                    'development_id' => $development,
                ],
                $payload
            );
        }

        return redirect()
            ->route('admin.products.development-prices.byStyle', [$development, $style])
            ->with('success', 'Precios por desarrollo actualizados correctamente.');
    }

    private function ensureValidDevelopmentAndStyle(int $development, string $style): void
    {
        if (!array_key_exists($development, self::MAIN_DEVELOPMENTS)) {
            abort(404);
        }

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

