<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

///// Modelo para almacenar configuraciones de casas
class Configuration extends Model
{
    protected $fillable = ['token', 'data', 'preview_image'];

    protected $casts = [
        'data' => 'array',
    ];
}
