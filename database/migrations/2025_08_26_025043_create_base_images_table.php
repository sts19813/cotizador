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
        Schema::create('base_images', function (Blueprint $table) {
            $table->id();
            $table->string('style'); // Minimalista, Tulum, Mexicano
            $table->string('path');  // ruta de la imagen
            $table->string('overlay')->nullable(); // opcional: overlay de pisos
            $table->integer('order')->default(0); // para controlar el orden
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('base_images');
    }
};
