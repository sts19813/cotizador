<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('leads', function (Blueprint $table) {
            $table->id();

            $table->string('nombre');
            $table->string('apellido');
            $table->string('email');
            $table->string('telefono');
            $table->text('mensaje')->nullable();

            $table->string('source')->default('landing'); // landing | configurador
            $table->decimal('total', 12, 2)->nullable();

            $table->json('configuration')->nullable();
            $table->json('miniaturas')->nullable();

            // LOTE
            $table->unsignedBigInteger('lote_id')->nullable();
            $table->string('lote_nombre')->nullable();
            $table->string('lote_origen')->nullable(); // svg | input | listado
            $table->boolean('lote_suma')->default(false);
            $table->decimal('lote_total', 12, 2)->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('leads');
    }
};
