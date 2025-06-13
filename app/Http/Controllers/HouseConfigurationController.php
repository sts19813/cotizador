<?php

namespace App\Http\Controllers;

use App\Models\HouseConfiguration;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HouseConfigurationController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['message' => 'No autenticado'], 401);
        }

        $data = $request->input('configuration');

        if (!$data || !is_array($data)) {
            return response()->json(['message' => 'Datos de configuración inválidos'], 400);
        }

        // Guardar en base de datos
        HouseConfiguration::create([
            'user_id' => $user->id,
            'configuration' => $data,
        ]);

        return response()->json(['message' => 'Configuración guardada correctamente']);
    }
}
