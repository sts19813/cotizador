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

        $pisosInterioresPath = "Minimalista/1 Pisos Interiores/";
        $pisosRegaderasPath = "Minimalista/2 Pisos Regaderas/";
        $mesetaCocinaPath = "Minimalista/3 Meseta Cocina/";
        $mesetaBanosPath = "Minimalista/4 Meseta Baños/";
        $murosRegaderasPath = "Minimalista/5 Muros Regaderas/";
        $murosInterioresBasePath = "Minimalista/6 Muros Interiores Base/";
        $murosInterioresAcentoPath = "Minimalista/7 Muros Interiores Acento/";
        $murosExteriorBasePath = "Minimalista/8 Muros Exterior Base/";
        $murosExteriorAcento01Path = "Minimalista/9 Muros Exterior Acento 01/";
        $murosExteriorAcento02Path = "Minimalista/10 Muros Exterior Acento 02/";
        $products = [
            [
                'category_name' => 'FACHADA',
                'style' => $style,
                'pre_code' => 'FAC01',
                'variant_code' => 'FA01',
                'version' => '00',
                'title' => 'Fachada A',
                'brand' => '',
                'base_price' => 544.00,
                'image_url' => 'baseMinimalista/fachadaA/01-F.jpg',
            ],
            [
                'category_name' => 'FACHADA',
                'style' => $style,
                'pre_code' => 'FAC01',
                'variant_code' => 'FA2',
                'version' => '00',
                'title' => 'Fachada B',
                'brand' => 'MIDO',
                'base_price' => 544.00,
                'image_url' => 'baseMinimalista/fachadaB/01-F.jpg',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M01',
                'version' => '00',
                'title' => 'MARMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 544.00,
                'image_url' => $pisosInterioresPath . 'Marmol Blanco Arena Pulido Mate.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M02',
                'version' => '00',
                'title' => 'MARMOL SANTO TOMÁS PULIDO MATE. FORMATO 30 cm x LARGOS LIBRES',
                'brand' => 'MIDO',
                'base_price' => 530.00,
                'image_url' => $pisosInterioresPath . 'Marmol Santo Tomás Pulido Mate.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M03',
                'version' => '00',
                'title' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR LIGHT GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00,
                'image_url' => $pisosInterioresPath . 'Ceramico Tipo Concreto Color Light.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M04',
                'version' => '00',
                'title' => 'CERÁMICO TIPO CONCRETO MOD. CITYLINE COLOR DARK GRAY. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 269.00,
                'image_url' => $pisosInterioresPath . 'Ceramico Tipo Concreto Color Dark Gray.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M05',
                'version' => '00',
                'title' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR IVORY. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00,
                'image_url' => $pisosInterioresPath . 'Cerámico Tipo Cemento Ivory.png',
            ],
            [
                'category_name' => 'PISOS INTERIORES',
                'style' => $style,
                'pre_code' => 'PIN01',
                'variant_code' => 'M06',
                'version' => '00',
                'title' => 'CERÁMICO TIPO CEMENTO MODELO CREATO COLOR GRAFITO. FORMATO 60X120',
                'brand' => 'INTERCERAMIC',
                'base_price' => 359.00,
                'image_url' => $pisosInterioresPath . 'Ceramico Tipo Cemento Color Grafito.png',
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Marmol Blanco Arena Aventejado Mate',
                'description' => 'Formato 30cm x largos libres',
                'brand' => 'MIDO',
                'base_price' => 439.00,
                'image_url' => $pisosRegaderasPath . 'Marmol Blanco Arena Aventejado Mate.png',
            ],
            [
                'category_name' => 'PISOS REGADERAS',
                'style' => $style,
                'pre_code' => 'PRE01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Marmol Santo Tomás  Avejentado',
                'description' => 'FORMATO 30 cm x LARGOS LIBRES',
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
                'title' => 'Ceramico Tipo Piedra Grigio',
                'description' => 'Mod. Materia Color Grigio formato 60x60',
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
                'title' => 'Ceramico Tipo Piedra Grafite',
                'description' => 'Mod. Materia Color Grafite formato 60x60',
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
                'title' => 'Granito Itaunas Pulido',
                'description' => '',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaCocinaPath . 'Granito Itaunas Pulido.png',
            ],
            [
                'category_name' => 'MESETA COCINA',
                'style' => $style,
                'pre_code' => 'MCO01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Granito San Gabriel Leather',
                'description' => 'Mod. Materia Color Grafite formato 60x60',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaCocinaPath . 'Granito San Gabriel Leather.png',
            ],
            [
                'category_name' => 'MESETA COCINA',
                'style' => $style,
                'pre_code' => 'MCO01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Granito Bahamas White',
                'description' => 'Mod. Materia Color Grafite formato 60x60',
                'brand' => 'MIDO',
                'base_price' => 725.00,
                'image_url' => $mesetaCocinaPath . 'Granito Bahamas White.png',
            ],
            [
                'category_name' => 'MESETAS BAÑOS',
                'style' => $style,
                'pre_code' => 'MES02',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Granito Itaunas Pulido',
                'description' => '',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaBanosPath . 'Granito Itaunas Pulido.png',
            ],
            [
                'category_name' => 'MESETAS BAÑOS',
                'style' => $style,
                'pre_code' => 'MES02',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Granito San Gabriel Leather',
                'description' => 'Mod. Materia Color Grafite formato 60x60',
                'brand' => 'MIDO',
                'base_price' => 675.00,
                'image_url' => $mesetaBanosPath . 'Granito San Gabriel Leather.png',
            ],
            [
                'category_name' => 'MESETAS BAÑOS',
                'style' => $style,
                'pre_code' => 'MES02',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Granito Bahamas White',
                'description' => 'Mod. Materia Color Grafite formato 60x60',
                'brand' => 'MIDO',
                'base_price' => 725.00,
                'image_url' => $mesetaBanosPath . 'Granito Bahamas White.png',
            ],

            /**################################################################################### */
            [
                'category_name' => 'MUROS REGADERAS',
                'style' => $style,
                'pre_code' => 'MRE01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'MÁRMOL BLANCO ARENA PULIDO MATE. FORMATO 30 cm X LARGOS LIBRES',
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
                'title' => 'MÁRMOL SANTO TOMÁS PULIDO AVEJENTADO. FORMATO 30 cm X LARGOS LIBRES',
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
                'title' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRIGIO. FORMATO 60X60',
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
                'title' => 'CERÁMICO TIPO PIEDRA MOD. MATERIA COLOR GRAFITE. FORMATO 60X60',
                'brand' => 'INTERCERAMIC',
                'base_price' => 289.00,
                'image_url' => $murosRegaderasPath . 'Ceramico Tipo Piedra Grafite.png',
            ],


            /**################################################################################### */


            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'PINTURA BLANCO CLARA',
                'brand' => 'MIDO',
                'base_price' => 35.00,
                'image_url' => $murosInterioresBasePath . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T05',
                'version' => '00',
                'title' => 'PLASTER CONCRETO APARENTE',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresBasePath . 'Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'PLASTER BLANCO SASCAB',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresBasePath . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES BASE',
                'style' => $style,
                'pre_code' => 'MIB01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'GRIS ESPÁTULA',
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
                'title' => 'NEUTRO MUSEO',
                'brand' => 'MIDO',
                'base_price' => 40.00,
                'image_url' => $murosInterioresBasePath . 'Neutro Museo.png',
            ],

            /**################################################################################### */

            [
                'category_name' => 'MUROS INTERIORES ACENTO',
                'style' => $style,
                'pre_code' => 'MIA01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'PINTURA BLANCO CLARA',
                'brand' => 'MIDO',
                'base_price' => 35.00,
                'image_url' => $murosInterioresAcentoPath . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES ACENTO',
                'style' => $style,
                'pre_code' => 'MIA01',
                'variant_code' => 'T05',
                'version' => '00',
                'title' => 'PLASTER CONCRETO APARENTE',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresAcentoPath . 'Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES ACENTO',
                'style' => $style,
                'pre_code' => 'MIA01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'PLASTER BLANCO SASCAB',
                'brand' => 'MIDO',
                'base_price' => 50.00,
                'image_url' => $murosInterioresAcentoPath . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES ACENTO',
                'style' => $style,
                'pre_code' => 'MIA01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'GRIS ESPÁTULA',
                'brand' => 'MIDO',
                'base_price' => 45.00,
                'image_url' => $murosInterioresAcentoPath . 'Gris Espátula.png',
            ],
            [
                'category_name' => 'MUROS INTERIORES ACENTO',
                'style' => $style,
                'pre_code' => 'MIA01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'NEUTRO MUSEO',
                'brand' => 'MIDO',
                'base_price' => 40.00,
                'image_url' => $murosInterioresAcentoPath . 'Neutro Museo.png',
            ],


            /**################################################################################### */


            [
                'category_name' => 'MUROS EXTERIOR BASE', 
                'pre_code' => 'MEB01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'Pintura Blanco Clara',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS EXTERIOR BASE',
                'pre_code' => 'MEB01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Plaster Concreto Aparente',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'MUROS EXTERIOR BASE',
                'pre_code' => 'MEB01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Plaster Blanco Sascab',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS EXTERIOR BASE',
                'pre_code' => 'MEB01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Masilla Concreto Estriado',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Masilla Concreto Estriado.png',
            ],


            [
                'category_name' => 'MUROS EXTERIOR BASE',
                'pre_code' => 'MEB01',
                'variant_code' => 'T05',
                'version' => '00',
                'title' => 'Gris Espátula',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Gris Espátula.png',
            ],
            [
                'category_name' => 'MUROS EXTERIOR BASE',
                'pre_code' => 'MEB01',
                'variant_code' => 'T06',
                'version' => '00',
                'title' => 'Neutro Museo',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorBasePath . 'Neutro Museo.png',
            ],



            /**################################################################################### */



            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'Pintura Blanco Clara',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Plaster Concreto Aparente',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Plaster Blanco Sascab',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Masilla Concreto Estriado',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Masilla Concreto Estriado.png',
            ],


            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T05',
                'version' => '00',
                'title' => 'Gris Espátula',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Gris Espátula.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 01',
                'pre_code' => 'MEA01',
                'variant_code' => 'T06',
                'version' => '00',
                'title' => 'Neutro Museo',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento01Path . 'Neutro Museo.png',
            ],


            /**#################################################################################### */
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'Pintura Blanco Clara',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Pintura Blanco Clara.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Plaster Concreto Aparente',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Plaster Blanco Sascab',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Plaster Blanco Sascab.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Masilla Concreto Estriado',
                'brand' => 'KIMIKOLOR',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Masilla Concreto Estriado.png',
            ],


            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T05',
                'version' => '00',
                'title' => 'Gris Espátula',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Gris Espátula.png',
            ],
            [
                'category_name' => 'MUROS EXTERIORES ACENTO 02',
                'pre_code' => 'MEA02',
                'variant_code' => 'T06',
                'version' => '00',
                'title' => 'Neutro Museo',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => $murosExteriorAcento02Path . 'Neutro Museo.png',
            ],



            /**#################################################################################### */


            [
                'category_name' => 'PLAFONES',
                'pre_code' => 'PLA01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'PINTURA BLANCO CLARA 020-01',
                'brand' => 'COMEX',
                'base_price' => 0,
                'image_url' => 'Minimalista/11 Plafones/Blanco Clara.png',
            ],
            [
                'category_name' => 'PLAFONES',
                'pre_code' => 'PLA01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Plaster Concreto Aparente',
                'brand' => 'KIMIKOLOR',
                'base_price' => 290,
                'image_url' => 'Minimalista/11 Plafones/Plaster Concreto Aparente.png',
            ],
            [
                'category_name' => 'PLAFONES',
                'pre_code' => 'PLA01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Plaster Blanco Sascab',
                'brand' => '',
                'base_price' => 290,
                'image_url' => 'Minimalista/11 Plafones/Plaster Blanco Sascab.png',
            ],



/**#################################################################################### */

            [
                'category_name' => 'PUERTAS',
                'pre_code' => 'PUE01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Tambor de Triplay de Encino Nogal',
                'brand' => 'BETA STUDIO',
                'base_price' => 7300.00,
                'image_url' => 'Minimalista/12 Puertas/Tambor de Triplay de Encino Nogal.png',
            ],
            [
                'category_name' => 'PUERTAS',
                'pre_code' => 'PUE01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Tambor de Triplay de Encino Maple',
                'brand' => 'BETA STUDIO',
                'base_price' => 8000.00,
                'image_url' => 'Minimalista/12 Puertas/Tambor de Triplay de Encino Maple.png',
            ],
            [
                'category_name' => 'PUERTAS',
                'pre_code' => 'PUE01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Tambor de Triplay de Encino Acabado Blanco Mate Poreado',
                'brand' => 'BETA STUDIO',
                'base_price' => 7300.00,
                'image_url' => 'Minimalista/12 Puertas/Tambor de Triplay de Encino Acabado Blanco Mate Poreado.png',
            ],
            [
                'category_name' => 'PUERTAS',
                'pre_code' => 'PUE01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Tambor de Triplay de Encino Acabado Negro Mate Poreado',
                'brand' => 'BETA STUDIO',
                'base_price' => 7300.00,
                'image_url' => 'Minimalista/12 Puertas/Tambor de Triplay de Encino Acabado Negro Mate Poreado.png',
            ],

/**#################################################################################### */



            [
                'category_name' => 'CANCELERÍA',
                'pre_code' => 'CAN01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Perfil de Aluminio Color Negro',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/13 Cancelería/Perfil de Aluminio Color Negro.png',
            ],
            [
                'category_name' => 'CANCELERÍA',
                'pre_code' => 'CAN01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Perfil de Aluminio Color Blanco',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/13 Cancelería/Perfil de Aluminio Color Blanco.png',
            ],
            [
                'category_name' => 'CANCELERÍA',
                'pre_code' => 'CAN01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Perfil de Aluminio Color Natural',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/13 Cancelería/Perfil de Aluminio Color Natural.png',
            ],



/**#################################################################################### */


            [
                'category_name' => 'CARPINTERÍA',
                'pre_code' => 'CAR01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Tablero de MDF o MDP Laminado Tipo Roble',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Roble.png',
            ],
            [
                'category_name' => 'CARPINTERÍA',
                'pre_code' => 'CAR01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Tablero de MDF o MDP Laminado Tipo Beige Mate Liso',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Beige Mate Liso.png',
            ],
            [
                'category_name' => 'CARPINTERÍA',
                'pre_code' => 'CAR01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'Tablero de MDF o MDP Laminado Tipo Grafito Mate',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Grafito Mate.png',
            ],
             [
                'category_name' => 'CARPINTERÍA',
                'pre_code' => 'CAR01',
                'variant_code' => 'T04',
                'version' => '00',
                'title' => 'Tablero de MDF o MDP Laminado Tipo Blanco Mate Liso',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/14 Carpintería/Tablero de MDF o MDP Laminado Tipo Blanco Mate Liso.png',
            ],

/**#################################################################################### */


            [
                'category_name' => 'BAÑOS',
                'pre_code' => 'BAN01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Grifería y Accesorios Acabado Cromo',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/15 Baños/Grifería y Accesorios Acabado Cromo.png',
            ],
            [
                'category_name' => 'BAÑOS',
                'pre_code' => 'BAN01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Grifería y Accesorios Acabado Dorado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/15 Baños/Grifería y Accesorios Acabado Dorado.png',
            ],
            [
                'category_name' => 'BAÑOS',
                'pre_code' => 'BAN01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Grifería y Accesorios Acabado Negro Mate',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/15 Baños/Grifería y Accesorios Acabado Negro Mate.png',
            ],

/**#################################################################################### */


            [
                'category_name' => 'ACCESORIOS ELÉCTRICOS',
                'pre_code' => 'AEL01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Acabado Satinado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/16 Accesorios Eléctricos/Acabado Satinado.png',
            ],
            [
                'category_name' => 'ACCESORIOS ELÉCTRICOS',
                'pre_code' => 'AEL01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Acabado Blanco',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/16 Accesorios Eléctricos/Acabado Blanco.png',
            ],
            [
                'category_name' => 'ACCESORIOS ELÉCTRICOS',
                'pre_code' => 'AEL01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Acabado Negro Mate',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/16 Accesorios Eléctricos/Acabado Negro Mate.png',
            ],

            /**#################################################################################### */
            [
                'category_name' => 'ACCESORIOS PUERTAS',
                'pre_code' => 'APU01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Acabado Aluminio Satinado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/17 Accesorio Puertas/Acabado Aluminio Satinado.png',
            ],
            [
                'category_name' => 'ACCESORIOS PUERTAS',
                'pre_code' => 'APU01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Acabado Dorado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/17 Accesorio Puertas/Acabado Dorado.png',
            ],
            [
                'category_name' => 'ACCESORIOS PUERTAS',
                'pre_code' => 'APU01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Acabado Negro Mate',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/17 Accesorio Puertas/Acabado Negro Mate.png',
            ],


/**#################################################################################### */


            [
                'category_name' => 'ACCESORIO CLOSETS',
                'pre_code' => 'ACL01',
                'variant_code' => 'T01',
                'version' => '00',
                'title' => 'Acabado Aluminio Satinado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/18 Accesorio Closets/Acabado Aluminio Satinado.png',
            ],
            [
                'category_name' => 'ACCESORIO CLOSETS',
                'pre_code' => 'ACL01',
                'variant_code' => 'T02',
                'version' => '00',
                'title' => 'Acabado Dorado',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/18 Accesorio Closets/Acabado Dorado.png',
            ],
            [
                'category_name' => 'ACCESORIO CLOSETS',
                'pre_code' => 'ACL01',
                'variant_code' => 'T03',
                'version' => '00',
                'title' => 'Acabado Negro Mate',
                'brand' => '',
                'base_price' => 0,
                'image_url' => 'Minimalista/18 Accesorio Closets/Acabado Negro Mate.png',
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
                    'title' => $product['title'],
                    'brand' => $product['brand'],
                    'base_price' => $product['base_price'],
                    'image_url' => $product['image_url'],
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
