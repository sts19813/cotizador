<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Category;
use App\Models\User;
use App\Models\HouseConfiguration;

class AdminController extends Controller
{
    public function dashboard()
    {
        $user = Auth::user();

        // Protección extra por si no se puso en la ruta
        if (!$user || !$user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }

        $leads = User::latest()->get();
        $products = Product::latest()->get();
        $Houses = HouseConfiguration::latest()->get();

        // Aquí puedes pasar datos al dashboard si quieres
        return view('admin.dashboard', compact('leads', 'products', 'Houses'));
    }  
}
