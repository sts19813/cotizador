<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ZoneDevelopment extends Model
{
    use HasFactory;

    protected $fillable = [
        'zone_id',
        'development_id',
        'development_name',
    ];

    protected $casts = [
        'zone_id' => 'integer',
        'development_id' => 'integer',
    ];

    public function zone()
    {
        return $this->belongsTo(Zone::class);
    }
}
