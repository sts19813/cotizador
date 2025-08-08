<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class TemplateCategoryView extends Model
{
    protected $fillable = [
        'category_id',
        'view_index',
        'view_name',
        'base_image_path',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}