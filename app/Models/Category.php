<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Category extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'orden','is_active', 'style'];

    public function products()
    {
        return $this->hasMany(Product::class);
    }

    public function templateViews()
    {
        return $this->hasMany(TemplateCategoryView::class);
    }
}
