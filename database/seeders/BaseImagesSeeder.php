<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\BaseImage;

class BaseImagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         $minimalista = [
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/fachadaA/01-F.jpg', 'overlay' => null, 'order' => 1],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/fachadaA/02-R.jpg', 'overlay' => null, 'order' => 2],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/fachadaA/03L.jpg',  'overlay' => null, 'order' => 3],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/fachadaA/04-B.jpg', 'overlay' => null, 'order' => 4],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/MINIMALISTA-SALA-BASE.jpg', 'overlay' => 'baseMinimalista/PISOS/Cocina/COCINA-M01.png', 'order' => 5],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/MINIMALISTA-COCINA-BASE.jpg', 'overlay' => 'baseMinimalista/PISOS/Recamara/CUARTO-M01.png', 'order' => 6],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/MINIMALISTA-RECAMARA-BASE.jpg', 'overlay' => 'baseMinimalista/PISOS/Sala/SALA-M01.png', 'order' => 7],
            ['style' => 'Minimalista', 'path' => '/baseMinimalista/MINIMALISTA-Bano-BASE.jpg', 'overlay' => 'baseMinimalista/PISOS/Sala/SALA-M01.png', 'order' => 8],
        ];

          BaseImage::insert($minimalista);


        
        $mexicano = [
            ['style' => 'Mexicano', 'path' => '/bases/01-MEX-Frontal-BASE.jpg', 'overlay' => null, 'order' => 1],
            ['style' => 'Mexicano', 'path' => '/bases/02-MEX-Derecha-BASE.jpg', 'overlay' => null, 'order' => 2],
            ['style' => 'Mexicano', 'path' => '/bases/03-Mex-Trasera-BASE.jpg', 'overlay' => null, 'order' => 3],
            ['style' => 'Mexicano', 'path' => '/bases/04-MEX-izquierda-BASE.jpg', 'overlay' => null, 'order' => 4],
            ['style' => 'Mexicano', 'path' => '/bases/05-MEX-Sala.webp', 'overlay' => null, 'order' => 5],
            ['style' => 'Mexicano', 'path' => '/bases/06-MEX-Cocina.webp', 'overlay' => null, 'order' => 6],
            ['style' => 'Mexicano', 'path' => '/bases/07-MEX-Recamara-Base.webp', 'overlay' => null, 'order' => 7],
            ['style' => 'Mexicano', 'path' => '/bases/08-MEX-Baño-Base.webp', 'overlay' => null, 'order' => 8],
        ];

        BaseImage::insert($mexicano);
    }
}
