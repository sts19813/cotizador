<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ProductRender extends Model
{
    use HasFactory;

    // Nombre de la tabla (opcional si sigue convención)
    protected $table = 'product_renders';

    // Campos que se pueden asignar en masa
    protected $fillable = [
        'product_id',
        'image_1',
        'image_2',
        'image_3',
        'image_4',
        'image_5',
        'image_6',
        'image_7',
        'image_8',
        'image_9',
    ];

    /**
     * Relación: Un render pertenece a un producto.
     */
    public function product()
    {
        return $this->belongsTo(Product::class);
    }
}
