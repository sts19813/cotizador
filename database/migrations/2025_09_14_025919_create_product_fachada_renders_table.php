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
        Schema::create('product_fachada_renders', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained()->onDelete('cascade');

            // Nombre o clave de fachada (ejemplo: "Fachada A", "Fachada B"...)
            $table->string('fachada');

            // 4 imágenes base para la fachada
            $table->string('base_image_1')->nullable();
            $table->string('base_image_2')->nullable();
            $table->string('base_image_3')->nullable();
            $table->string('base_image_4')->nullable();

            $table->timestamps();

            $table->unique(['product_id', 'fachada']); // fachada única por producto
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_fachada_renders');
    }
};
