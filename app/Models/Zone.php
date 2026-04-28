<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Zone extends Model
{
    use HasFactory;

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

    public function developments()
    {
        return $this->hasMany(ZoneDevelopment::class);
    }

    public function productPrices()
    {
        return $this->hasMany(ProductZonePrice::class);
    }
}
