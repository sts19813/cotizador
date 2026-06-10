<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

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
        'is_visible',

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
        'is_visible' => 'boolean',

        'fachada_1_price' => 'float',
        'fachada_2_price' => 'float',
        'fachada_3_price' => 'float',
        'fachada_4_price' => 'float',
        'fachada_5_price' => 'float',
        'fachada_6_price' => 'float',
        'fachada_7_price' => 'float',
    ];

    protected $appends = [
        'public_image_url',
    ];

    public function getPublicImageUrlAttribute(): ?string
    {
        $imageUrl = trim((string) $this->image_url);

        if ($imageUrl === '') {
            return null;
        }

        if (Str::startsWith($imageUrl, ['http://', 'https://'])) {
            return $imageUrl;
        }

        $path = preg_replace('#^/?public/#', '', $imageUrl) ?? $imageUrl;
        $path = ltrim($path, '/');
        $storagePath = preg_replace('#^storage/#', '', $path) ?? $path;

        if (Storage::disk('public')->exists($storagePath)) {
            return '/storage/'.$storagePath;
        }

        if (file_exists(public_path($path))) {
            return '/'.$path;
        }

        return '/'.$path;
    }

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

    public function developmentPrices()
    {
        return $this->hasMany(ProductDevelopmentPrice::class);
    }

    public function zonePrices()
    {
        return $this->hasMany(ProductZonePrice::class);
    }
}
