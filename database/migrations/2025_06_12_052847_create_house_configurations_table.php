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
            $table->uuid('id')->primary(); // El id de esta tabla puede ser UUID sin problema

            $table->unsignedBigInteger('user_id'); // <-- tipo entero para hacer match con users.id (int/bigint)

            // Llave foránea que referencia users.id (int)
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');

            $table->json('configuration'); // campo JSON
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
