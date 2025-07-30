<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProductSeederMinimalista extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M01',
                'version' => '00',
                'description' => 'MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M02',
                'version' => '00',
                'description' => 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 530.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR LIGHT GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR DARK GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M05',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR IVORY. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'M06',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR GRAFITO. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00
            ],
        ];

        foreach ($products as $product) {
            $categoryId = DB::table('categories')
            ->where('name', $product['category_name'])
            ->where('style', 'Minimalista')
            ->value('id');

            if ($categoryId) {
                DB::table('products')->insert([
                    'category_id' => $categoryId,
                    'style' => 'Minimalista',
                    'pre_code' => $product['pre_code'],
                    'variant_code' => $product['variant_code'],
                    'version' => $product['version'],
                    'description' => $product['description'],
                    'brand' => $product['brand'],
                    'base_price' => $product['base_price'],
                    'one_bedroom_price' => 0,
                    'two_bedroom_price' => 0,
                    'three_bedroom_price' => 0,
                    'four_bedroom_price' => 0,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        }
    }
}