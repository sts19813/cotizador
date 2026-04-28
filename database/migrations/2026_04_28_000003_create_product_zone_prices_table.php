<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('product_zone_prices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->foreignId('zone_id')->constrained()->cascadeOnDelete();
            $table->decimal('base_price', 10, 2)->nullable();

            for ($i = 1; $i <= 7; $i++) {
                $table->decimal("fachada_{$i}_price", 10, 2)->nullable();
            }

            $table->timestamps();

            $table->unique(['product_id', 'zone_id']);
            $table->index('zone_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('product_zone_prices');
    }
};
