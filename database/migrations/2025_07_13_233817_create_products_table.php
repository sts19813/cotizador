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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('category_id')->constrained()->onDelete('cascade');
            $table->enum('style', ['Minimalista', 'Tulum', 'Mexicano']);
            $table->string('pre_code');       // ej. PIN01
            $table->string('variant_code');   // ej. T01
            $table->string('version');
            $table->text('title');
            $table->text('description')->nullable();
            $table->string('brand')->nullable();
            $table->decimal('base_price', 10, 2);
            $table->string('image_url')->nullable();
            $table->string('product_url')->nullable();
        
            // ✅ Precios por tamaño de casa
            $table->decimal('one_bedroom_price', 10, 2)->default(0);
            $table->decimal('two_bedroom_price', 10, 2)->default(0);
            $table->decimal('three_bedroom_price', 10, 2)->default(0);
            $table->decimal('four_bedroom_price', 10, 2)->default(0);
        
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
