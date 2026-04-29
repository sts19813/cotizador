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
        Schema::create('product_development_prices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->unsignedBigInteger('development_id');

            for ($i = 1; $i <= 7; $i++) {
                $table->decimal("fachada_{$i}_price", 10, 2)->default(0);
            }

            $table->timestamps();

            $table->unique(['product_id', 'development_id'], 'product_dev_price_unique');
            $table->index('development_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_development_prices');
    }
};

