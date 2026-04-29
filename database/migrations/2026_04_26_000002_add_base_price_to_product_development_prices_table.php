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
        Schema::table('product_development_prices', function (Blueprint $table) {
            if (!Schema::hasColumn('product_development_prices', 'base_price')) {
                $table->decimal('base_price', 10, 2)->nullable()->after('development_id');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('product_development_prices', function (Blueprint $table) {
            if (Schema::hasColumn('product_development_prices', 'base_price')) {
                $table->dropColumn('base_price');
            }
        });
    }
};

