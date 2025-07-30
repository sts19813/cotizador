<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            'Fachada',
            'Pisos Interiores',
            'Pisos Regaderas',
            'Meseta Cocina',
            'Mesetas Baños',
            'Muros Regaderas',
            'Muros Interiores Base',
            'Muros Interiores Acento',
            'Muros Exterior Base',
            'Muros Exteriores Acento 01',
            'Muros Exteriores Acento 02',
            'Basamento',
            'Plafones',
            'Puertas',
            'Cancelería',
            'Carpintería',
            'Baños',
            'Accesorios Eléctricos',
            'Accesorios Puertas',
            'Accesorio Closets',
        ];

        foreach ($categories as $index => $name) {
            DB::table('categories')->insert([
                'name' => $name,
                'orden' => $index + 1,
                'is_active' => true,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
