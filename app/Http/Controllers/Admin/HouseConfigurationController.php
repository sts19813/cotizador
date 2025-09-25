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

        $configuration = $request->input('configuration');
        $miniaturasData = $request->input('miniaturasData');
        $precioTotal = $request->input('precioTotal');
        $fecha = $request->input('fecha');

        if (!$configuration || !is_array($configuration)) {
            return response()->json(['message' => 'Datos de configuración inválidos'], 400);
        }

        HouseConfiguration::create([
            'user_id' => $user->id,
            'configuration' => $configuration,
            'miniaturas_data' => $miniaturasData,
            'precio_total' => $precioTotal ?? 0,
            'fecha' => $fecha ?? now(),
        ]);

        return response()->json(['message' => 'Configuración guardada correctamente']);
    }

    public function list()
    {
        $user = Auth::user();
        $configurations = HouseConfiguration::with('user')->where('user_id', $user->id)->latest()->get();
        return view('list', compact('configurations'));
    }
}
