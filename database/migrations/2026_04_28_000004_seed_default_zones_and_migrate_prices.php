<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('zones') || !Schema::hasTable('zone_developments')) {
            return;
        }

        $now = now();

        $meridaId = DB::table('zones')->where('slug', 'zona-merida')->value('id');
        if (!$meridaId) {
            $meridaId = DB::table('zones')->insertGetId([
                'name' => 'Zona Mérida',
                'slug' => 'zona-merida',
                'image_url' => '/img/tulum.jpg',
                'is_active' => 1,
                'order' => 1,
                'created_at' => $now,
                'updated_at' => $now,
            ]);
        }

        $cancunId = DB::table('zones')->where('slug', 'zona-cancun')->value('id');
        if (!$cancunId) {
            DB::table('zones')->insert([
                'name' => 'Zona Cancún',
                'slug' => 'zona-cancun',
                'image_url' => '/img/plantas.jpg',
                'is_active' => 1,
                'order' => 2,
                'created_at' => $now,
                'updated_at' => $now,
            ]);
        }

        $meridaDevelopments = [
            33 => 'Piaró',
            43 => 'Paseo Península',
            3 => 'Ahawell',
            2 => 'Portal',
            14 => 'Chakté',
            8 => 'Bayal',
            9 => 'Pakal',
            10 => 'Chechem',
        ];

        foreach ($meridaDevelopments as $developmentId => $developmentName) {
            DB::table('zone_developments')->updateOrInsert(
                [
                    'zone_id' => $meridaId,
                    'development_id' => $developmentId,
                ],
                [
                    'development_name' => $developmentName,
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }

        if (!Schema::hasTable('product_development_prices') || !Schema::hasTable('product_zone_prices')) {
            return;
        }

        $byProduct = DB::table('product_development_prices')
            ->whereIn('development_id', array_keys($meridaDevelopments))
            ->get()
            ->groupBy('product_id');

        $priority = array_keys($meridaDevelopments);

        foreach ($byProduct as $productId => $rows) {
            $selected = null;
            foreach ($priority as $developmentId) {
                $candidate = $rows->firstWhere('development_id', $developmentId);
                if ($candidate) {
                    $selected = $candidate;
                    break;
                }
            }

            if (!$selected) {
                continue;
            }

            DB::table('product_zone_prices')->updateOrInsert(
                [
                    'product_id' => (int) $productId,
                    'zone_id' => (int) $meridaId,
                ],
                [
                    'base_price' => $selected->base_price,
                    'fachada_1_price' => $selected->fachada_1_price,
                    'fachada_2_price' => $selected->fachada_2_price,
                    'fachada_3_price' => $selected->fachada_3_price,
                    'fachada_4_price' => $selected->fachada_4_price,
                    'fachada_5_price' => $selected->fachada_5_price,
                    'fachada_6_price' => $selected->fachada_6_price,
                    'fachada_7_price' => $selected->fachada_7_price,
                    'updated_at' => $now,
                    'created_at' => $now,
                ]
            );
        }
    }

    public function down(): void
    {
        if (!Schema::hasTable('zones') || !Schema::hasTable('zone_developments')) {
            return;
        }

        $zoneIds = DB::table('zones')
            ->whereIn('slug', ['zona-merida', 'zona-cancun'])
            ->pluck('id');

        if ($zoneIds->isNotEmpty()) {
            if (Schema::hasTable('product_zone_prices')) {
                DB::table('product_zone_prices')->whereIn('zone_id', $zoneIds)->delete();
            }

            DB::table('zone_developments')->whereIn('zone_id', $zoneIds)->delete();
            DB::table('zones')->whereIn('id', $zoneIds)->delete();
        }
    }
};
