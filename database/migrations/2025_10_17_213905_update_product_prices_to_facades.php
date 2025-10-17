<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
         Schema::table('products', function (Blueprint $table) {
            // 🔻 Eliminar columnas antiguas (si existen)
            if (Schema::hasColumn('products', 'one_bedroom_price')) {
                $table->dropColumn([
                    'one_bedroom_price',
                    'two_bedroom_price',
                    'three_bedroom_price',
                    'four_bedroom_price',
                ]);
            }

            // 🔹 Agregar columnas nuevas para fachadas
            for ($i = 1; $i <= 7; $i++) {
                $table->decimal("fachada_{$i}_price", 10, 2)->default(0)->after('base_price');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products', function (Blueprint $table) {
            // 🔻 Eliminar las columnas de fachadas
            for ($i = 1; $i <= 7; $i++) {
                if (Schema::hasColumn('products', "fachada_{$i}_price")) {
                    $table->dropColumn("fachada_{$i}_price");
                }
            }

            // 🔹 Volver a crear las columnas antiguas (por recámaras)
            $table->decimal('one_bedroom_price', 10, 2)->default(0);
            $table->decimal('two_bedroom_price', 10, 2)->default(0);
            $table->decimal('three_bedroom_price', 10, 2)->default(0);
            $table->decimal('four_bedroom_price', 10, 2)->default(0);
        });
    }
};
