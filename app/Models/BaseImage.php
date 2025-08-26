<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class BaseImage  extends Model
{
    use HasFactory;

    protected $fillable = ['style', 'path', 'overlay', 'order'];


}
