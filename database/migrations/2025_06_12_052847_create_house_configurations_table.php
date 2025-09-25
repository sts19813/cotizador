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
       Schema::create('house_configurations', function (Blueprint $table) {
            $table->uuid('id')->primary();

            $table->unsignedBigInteger('user_id');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->json('configuration'); // Se mantiene para savedSelections
            $table->json('miniaturas_data')->nullable(); // Guardar miniaturas con base y overlays
            $table->decimal('precio_total', 10, 2)->default(0); // Guardar precio total
            $table->timestamp('fecha')->nullable(); // Guardar la fecha de guardado

            $table->enum('status', ['Guardada', 'Solicitada'])->default('Guardada');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('house_configurations');
    }
};
