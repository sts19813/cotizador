<?php

use App\Models\ProductFachadaRender;
use Illuminate\Foundation\Inspiring;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\File;

Artisan::command('inspire', function () {
    $this->comment(Inspiring::quote());
})->purpose('Display an inspiring quote');

Artisan::command('renders:delete-mexicano-planta-alta-3b {--dry-run : Muestra lo que se borraria sin aplicar cambios} {--keep-files : Borra solo registros de BD y conserva archivos fisicos}', function () {
    $renders = ProductFachadaRender::with(['product.category'])
        ->where('fachada', 'Fachada 3B')
        ->whereHas('product', function ($query) {
            $query->where('style', 'Mexicano')
                ->whereHas('category', function ($categoryQuery) {
                    $categoryQuery->where('name', 'Planta Alta');
                });
        })
        ->orderBy('product_id')
        ->get();

    if ($renders->isEmpty()) {
        $this->info('No se encontraron renders de Planta Alta / Mexicano / Fachada 3B.');
        return 0;
    }

    $files = $renders
        ->flatMap(function (ProductFachadaRender $render) {
            return collect(range(1, 4))
                ->map(fn ($index) => $render->{"base_image_{$index}"})
                ->filter()
                ->map(fn ($path) => public_path(ltrim($path, '/')));
        })
        ->unique()
        ->values();

    $this->info("Renders de BD encontrados: {$renders->count()}");
    $this->info("Archivos referenciados: {$files->count()}");

    $renders->each(function (ProductFachadaRender $render) {
        $product = $render->product;
        $category = $product?->category;

        $this->line(sprintf(
            '- render_id=%s product_id=%s categoria="%s" producto="%s"',
            $render->id,
            $render->product_id,
            $category?->name ?? '',
            $product?->title ?? ''
        ));
    });

    if ($this->option('dry-run')) {
        $this->warn('Dry run: no se borro ningun registro ni archivo.');
        return 0;
    }

    if (! $this->option('keep-files')) {
        $files->each(function (string $filePath) {
            if (File::exists($filePath)) {
                File::delete($filePath);
                $this->line("Archivo eliminado: {$filePath}");
            }
        });
    }

    ProductFachadaRender::whereIn('id', $renders->pluck('id'))->delete();

    $this->info('Renders de Planta Alta / Mexicano / Fachada 3B eliminados correctamente.');

    return 0;
})->purpose('Elimina renders de Planta Alta para Mexicano en Fachada 3B');
