<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HouseConfiguration;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\Request;


class HouseConfigurationController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        if (!$user || !$user->isAdmin()) {
            abort(403);
        }

        $configurations = HouseConfiguration::with('user')->latest()->get();

        return view('admin.houses.index', compact('configurations'));
    }

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
