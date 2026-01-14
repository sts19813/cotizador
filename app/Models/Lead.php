<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Lead extends Model
{
    use HasFactory;

    protected $fillable = [
        'nombre',
        'apellido',
        'email',
        'telefono',
        'mensaje',
        'source',
        'total',
        'configuration',
        'miniaturas',
        'lote_id',
        'lote_nombre',
        'lote_origen',
        'lote_suma',
        'lote_total'
    ];

    protected $casts = [
        'configuration' => 'array',
        'miniaturas' => 'array',
        'lote_suma' => 'boolean'
    ];
}
