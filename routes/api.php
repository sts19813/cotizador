<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategoryController;

Route::get('/categoriesAPI', [CategoryController::class, 'index']);
Route::get('/categoriesAPI/{id}', [CategoryController::class, 'show']);