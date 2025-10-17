<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_id',
        'style',
        'pre_code',
        'variant_code',
        'version',
        'title',
        'description',
        'brand',
        'base_price',
        'image_url',
        'product_url',

        'fachada_1_price',
        'fachada_2_price',
        'fachada_3_price',
        'fachada_4_price',
        'fachada_5_price',
        'fachada_6_price',
        'fachada_7_price',
    ];

    protected $casts = [
        'base_price' => 'float',

        'fachada_1_price' => 'float',
        'fachada_2_price' => 'float',
        'fachada_3_price' => 'float',
        'fachada_4_price' => 'float',
        'fachada_5_price' => 'float',
        'fachada_6_price' => 'float',
        'fachada_7_price' => 'float',
    ];

    // 🔗 Relaciones
    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function renders()
    {
        return $this->hasOne(ProductRender::class);
    }

    public function fachadaRenders()
    {
        return $this->hasMany(ProductFachadaRender::class);
    }
}
