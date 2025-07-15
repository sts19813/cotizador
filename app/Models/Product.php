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
        'description',
        'brand',
        'base_price',
        'image_url',
        'product_url',
        'one_bedroom_price',
        'two_bedroom_price',
        'three_bedroom_price',
        'four_bedroom_price',
    ];

    protected $casts = [
        'base_price' => 'float',
        'one_bedroom_price' => 'float',
        'two_bedroom_price' => 'float',
        'three_bedroom_price' => 'float',
        'four_bedroom_price' => 'float',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
