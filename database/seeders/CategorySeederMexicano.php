<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeederMexicano extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            'Pisos Interiores',
            'Pisos Regaderas',
            'Meseta Cocina',
            'Mesetas Baños',
            'Muros Regaderas',
            'Muros Interiores Base',
            'Muros Interiores Acento',
            'Muros Exterior Base',
            'Muros Exterior Acento 01',
            'Plafones',
            'Puertas',
            'Cancelería',
            'Cocinas, Closet y Muebles Bajo Cubierta',
            'Grifería y Accesorios de Baño',
            'Accesorios Eléctricos',
            'Accesorios Puertas',
            'Accesorios Closets',
        ];

        foreach ($categories as $index => $name) {
            DB::table('categories')->insert([
                'name' => $name,
                'orden' => $index + 1,
                'is_active' => true,
                'style' => 'Mexicano',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
