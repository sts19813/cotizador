<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('zone_developments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('zone_id')->constrained()->cascadeOnDelete();
            $table->unsignedBigInteger('development_id');
            $table->string('development_name');
            $table->timestamps();

            $table->unique(['zone_id', 'development_id']);
            $table->index('development_id');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('zone_developments');
    }
};
