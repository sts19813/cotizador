<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class ProductFachadaRender extends Model
{
     use HasFactory;

    protected $fillable = [
        'product_id',
        'fachada',
        'base_image_1',
        'base_image_2',
        'base_image_3',
        'base_image_4',
    ];

    // Relación inversa con producto
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
