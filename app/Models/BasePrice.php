<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BasePrice extends Model
{
    protected $fillable = ['style', 'price', 'image_url'];
}
