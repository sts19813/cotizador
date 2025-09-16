<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;
use App\Models\BaseImage;

use App\Models\Category;

class RenderController extends Controller
{
    /**
     * Display a listing of the resource.
     */

    public function index($style = 'Minimalista')
    {
        
      
        if ($style === 'home') $style = 'Minimalista';
        if ($style === 'tulum') $style = 'Tulum';
        if ($style === 'mexicano') $style = 'Mexicano';

        $allowedStyles = ['Minimalista', 'Tulum', 'Mexicano'];
        if (!in_array($style, $allowedStyles)) {
            abort(404);
        }

        // Productos con renders
        $products = Product::with(['renders', 'fachadaRenders'])->where('style', $style)->get();


        // Imágenes base desde la tabla base_images
        $baseImages = BaseImage::where('style', $style)
            ->orderBy('order')
            ->pluck('path') // solo valores
            ->toArray();

        return view('admin.render', compact('products', 'style', 'baseImages'));
    }

   public function update(Request $request, $id)
{
    $product = Product::findOrFail($id);
    $renderPath = public_path('render');
    if (!file_exists($renderPath)) mkdir($renderPath, 0777, true);

    // --- 1. Guardar renders por fachada ---
    $fachadas = $request->file('fachadas', []); // <-- archivos como array
    foreach($fachadas as $fachadaName => $images) {
        $fachadaData = [];
        for($i=1; $i<=4; $i++){
            if(isset($images["base_image_$i"])){
                $file = $images["base_image_$i"];
                $filename = "render_{$product->id}_{$fachadaName}_{$i}.".$file->getClientOriginalExtension();
                $file->move($renderPath, $filename);
                $fachadaData["base_image_$i"] = '/render/'.$filename;
            }
        }
        if($fachadaData){
            $product->fachadaRenders()->updateOrCreate(
                ['fachada' => $fachadaName],
                $fachadaData
            );
        }
    }

    // --- 2. Guardar renders generales (los 9) ---
    $generalData = [];
    for ($i = 1; $i <= 9; $i++) {
        $inputName = "image_$i";
        if ($request->hasFile($inputName)) {
            $file = $request->file($inputName);
            $filename = "render_{$product->id}_{$i}." . $file->getClientOriginalExtension();
            $file->move($renderPath, $filename);

            $generalData[$inputName] = '/render/' . $filename;
        }
    }
    if ($generalData) {
        $product->renders()->updateOrCreate([], $generalData);
    }

    return back()->with('success', 'Renders actualizados correctamente.');
}


}
