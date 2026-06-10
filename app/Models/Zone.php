<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Zone extends Model
{
    use HasFactory;

    private const FALLBACK_IMAGE_URL = '/img/tulum.jpg';

    protected $fillable = [
        'name',
        'slug',
        'image_url',
        'is_active',
        'order',
    ];

    protected $casts = [
        'is_active' => 'boolean',
        'order' => 'integer',
    ];

    public function getPublicImageUrlAttribute(): string
    {
        $imageUrl = trim((string) $this->image_url);

        if ($imageUrl === '') {
            return self::FALLBACK_IMAGE_URL;
        }

        if (Str::startsWith($imageUrl, ['http://', 'https://'])) {
            return $imageUrl;
        }

        $path = preg_replace('#^/?public/#', '', $imageUrl) ?? $imageUrl;
        $path = ltrim($path, '/');

        if ($path === '') {
            return self::FALLBACK_IMAGE_URL;
        }

        if (file_exists(public_path($path))) {
            return '/' . $path;
        }

        $slug = $this->slug ?: Str::slug($this->name);
        $extension = strtolower((string) pathinfo($path, PATHINFO_EXTENSION));
        $extensions = array_values(array_unique(array_filter([$extension, 'jpg', 'jpeg', 'png', 'webp'])));

        foreach ($extensions as $candidateExtension) {
            $candidatePath = "assets/img/zonas/{$slug}.{$candidateExtension}";

            if (file_exists(public_path($candidatePath))) {
                return '/' . $candidatePath;
            }
        }

        return '/' . $path;
    }

    public function developments()
    {
        return $this->hasMany(ZoneDevelopment::class);
    }

    public function productPrices()
    {
        return $this->hasMany(ProductZonePrice::class);
    }
}
