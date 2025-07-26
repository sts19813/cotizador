<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
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
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'TRAVERTINO PUEBLA FIORITO PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 418.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 530.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO MADERA. MOD. RAINFOREST COLOR TAUPE. FORMATO 20X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'T04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO MADERA. MOD. RAINFOREST COLOR NOGAL. FORMATO 20X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'T05',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR TAUPE. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'pre_code' => 'PIN01',
                'variant_code' => 'T06',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MODELO ACADIA COLOR TREMONT BROWN. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 299.00
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'pre_code' => 'PRE01',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'TRAVERTINO PUEBLA FIORITO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 439.00
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'pre_code' => 'PRE01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'pre_code' => 'PRE01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'pre_code' => 'PRE01',
                'variant_code' => 'T04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00
            ],
        ];

        foreach ($products as $product) {
            $categoryId = DB::table('categories')->where('name', $product['category_name'])->value('id');

            if ($categoryId) {
                DB::table('products')->insert([
                    'category_id' => $categoryId,
                    'style' => 'Tulum',
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
