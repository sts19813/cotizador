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
    public function index()
    {
        $user = Auth::user();

        if (!$user || !$user->isAdmin()) {
            abort(403, 'No tienes permisos para acceder a esta página.');
        }

        $products = Product::with('category')->latest()->get();
        $categories = Category::all();

        return view('admin.render', compact('products', 'categories'));
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
