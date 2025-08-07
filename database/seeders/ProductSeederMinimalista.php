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
        $style = 'Minimalista';
        $imageBasePath = "Minimalista/1 Pisos Interiores/";
        $pisosRegaderasPath = "Minimalista/2 Pisos Regaderas/";
        $mesetaCocinaPath = "Minimalista/3 Meseta Cocina/";
        $mesetaBanosPath = "Minimalista/4 Meseta Baños/";
        $murosRegaderasPath = "Minimalista/5 Muros Regaderas/";
        $murosInterioresBasePath = "Minimalista/6 Muros Interiores Base/";

        $products = [
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M01',
                'version' => '00',
                'description' => 'MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00,
                'image_url' => $imageBasePath . 'Marmol Blanco Arena Pulido Mate.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M02',
                'version' => '00',
                'description' => 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 530.00,
                'image_url' => $imageBasePath . 'Marmol Santo Tomás Pulido Mate.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR LIGHT GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00,
                'image_url' => $imageBasePath . 'Ceramico Tipo Concreto Color Light.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR DARK GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00,
                'image_url' => $imageBasePath . 'Ceramico Tipo Concreto Color Dark Gray.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M05',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR IVORY. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00,
                'image_url' => $imageBasePath . 'Cerámico Tipo Cemento Ivory.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M06',
                'version' => '00',
                'description' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR GRAFITO. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00,
                'image_url' => $imageBasePath . 'Ceramico Tipo Cemento Color Grafito.png',
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'TRAVERTINO PUEBLA FIORITO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 439.00,
                'image_url' => $pisosRegaderasPath . 'Marmol Santo Tomás  Avejentado.png', // 🔁 No se encontró “Travertino Puebla”, usé esta como equivalente.
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00,
                'image_url' => $pisosRegaderasPath . 'Marmol Santo Tomás  Avejentado.png',
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR TAUPE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00,
                'image_url' => $pisosRegaderasPath . 'Ceramico Tipo Piedra Grigio.png', // 🔁 Taupe no está, Grigio como sustituto cercano.
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR MARRONE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00,
                'image_url' => $pisosRegaderasPath . 'Ceramico Tipo Piedra Grafite.png', // 🔁 Marrone no está, Grafite como sustituto cercano.
            ],
            [
                'category_name' => 'MESETA COCINA',
                'style' => $style,
                'pre_code' => 'MCO01',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'GRANITO BAHAMAS WHITE. ACABADO PULIDO. FORMATO A CORTAR EN OBRA',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaCocinaPath . 'Granito Bahamas White.png',
            ],
            [
                'category_name' => 'MESETA COCINA',
                'style' => $style,
                'pre_code' => 'MCO01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'GRANITO ITAUNAS. ACABADO PULIDO. FORMATO A CORTAR EN OBRA',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaCocinaPath . 'Granito Itaunas Pulido.png',
            ],
            [
                'category_name' => 'MESETA COCINA',
                'style' => $style,
                'pre_code' => 'MCO01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'GRANITO SAN GABRIEL. ACABADO LEATHER. FORMATO A CORTAR EN OBRA',
                'brand' => 'MIDO',
                'base_price' => 725.00,
                'image_url' => $mesetaCocinaPath . 'Granito San Gabriel Leather.png',
            ],
            [
                'category_name' => 'MESETAS BAÑOS',
                'style' => $style,
                'pre_code' => 'MES02',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'GRANITO ITAUNAS PULIDO',
                'brand' => 'MIDO',
                'base_price' => 80.00,
                'image_url' => $mesetaBanosPath . 'Granito Itaunas Pulido.png',
            ],
            [
                'category_name' => 'MESETAS BAÑOS',
                'style' => $style,
                'pre_code' => 'MES02',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'GRANITO SAN GABRIEL LEATHER',
                'brand' => 'MIDO',
                'base_price' => 95.00,
                'image_url' => $mesetaBanosPath . 'Granito San Gabriel Leather.png',
            ],
            [
                'category_name' => 'MUROS REGADERAS',
                'style' => $style,
                'pre_code' => 'MRE01',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'MÁRMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 525.00,
                'image_url' => $murosRegaderasPath . 'Marmol Blanco Arena Pulido Mate.png',
            ],
            [
                'category_name' => 'MUROS REGADERAS',
                'style' => $style,
                'pre_code' => 'MRE01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm X LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00,
                'image_url' => $murosRegaderasPath . 'Marmol Santo Tomás Pulido Avejentado.png',
            ],
            [
                'category_name' => 'MUROS REGADERAS',
                'style' => $style,
                'pre_code' => 'MRE01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRIGIO. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00,
                'image_url' => $murosRegaderasPath . 'Ceramico Tipo Piedra Grigio.png',
            ],
            [
                'category_name' => 'MUROS REGADERAS',
                'style' => $style,
                'pre_code' => 'MRE01',
                'variant_code' => 'T04',
                'version' => '00',
                'description' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRAFITE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00,
                'image_url' => $murosRegaderasPath . 'Ceramico Tipo Piedra Grafite.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T01',
                'version' => '00',
                'description' => 'GRIS ESPÁTULA',
                'brand' => 'MIDO',
                'base_price' => 45.00,
                'image_url' => $murosInterioresBasePath . 'Gris Espátula.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T02',
                'version' => '00',
                'description' => 'NEUTRO MUSEO',
                'brand' => 'MIDO',
                'base_price' => 40.00,
                'image_url' => $murosInterioresBasePath . 'Neutro Museo.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T03',
                'version' => '00',
                'description' => 'PINTURA BLANCO CLARA',
                'brand' => 'MIDO',
                'base_price' => 35.00,
                'image_url' => $murosInterioresBasePath . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T04',
                'version' => '00',
                'description' => 'PLASTER BLANCO SASCAB',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresBasePath . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T05',
                'version' => '00',
                'description' => 'PLASTER CONCRETO APARENTE',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresBasePath . 'Plaster Concreto Aparente.png',
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