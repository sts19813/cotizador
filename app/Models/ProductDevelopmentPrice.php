<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductDevelopmentPrice extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_id',
        'development_id',
        'fachada_1_price',
        'fachada_2_price',
        'fachada_3_price',
        'fachada_4_price',
        'fachada_5_price',
        'fachada_6_price',
        'fachada_7_price',
    ];

    protected $casts = [
        'development_id' => 'integer',
        'fachada_1_price' => 'float',
        'fachada_2_price' => 'float',
        'fachada_3_price' => 'float',
        'fachada_4_price' => 'float',
        'fachada_5_price' => 'float',
        'fachada_6_price' => 'float',
        'fachada_7_price' => 'float',
    ];

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}

