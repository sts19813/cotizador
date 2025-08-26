<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\Category;

class RenderController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index($style = 'Minimalista')
    {
        $allowedStyles = ['Minimalista', 'Tulum', 'Mexicano'];

        if (!in_array($style, $allowedStyles)) {
            abort(404);
        }

        $user = Auth::user();

        if (!$user || !$user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }

        // Filtrar productos y categorías por estilo
        $products = Product::with('category')
            ->where('style', $style)
            ->latest()
            ->get();

        $categories = Category::whereHas('products', function ($query) use ($style) {
            $query->where('style', $style);
        })
        ->orderBy('orden')
        ->get();

        return view('admin.render', compact('products', 'categories', 'style'));
    }

    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $data = [];

        // Asegura que exista la carpeta public/render
        $renderPath = public_path('render');
        if (!file_exists($renderPath)) {
            mkdir($renderPath, 0777, true);
        }

        for ($i = 1; $i <= 9; $i++) {
            $inputName = "image_$i";
            if ($request->hasFile($inputName)) {
                $file = $request->file($inputName);
                $filename = "render_{$product->id}_{$i}." . $file->getClientOriginalExtension();
                $file->move($renderPath, $filename);

                $data[$inputName] = '/render/' . $filename;
            }
        }

        $product->renders()->updateOrCreate([], $data);

        return redirect()->back()->with('success', 'Renders actualizados correctamente.');
    }
}
