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
        Schema::create('base_prices', function (Blueprint $table) {
            $table->id();
            $table->string('style')->unique(); // Ej: 'Minimalista', 'Tulum', 'Mexicano'
            $table->decimal('price', 12, 2);   // Precio base
            $table->string('image_url')->nullable(); // URL del ícono o imagen
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('base_prices');
    }
};
