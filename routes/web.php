<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;
use App\Models\User;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\HouseConfigurationController;
use App\Http\Controllers\AdminController; 
use App\Http\Middleware\AdminMiddleware;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\LeadController;
use App\Http\Controllers\Admin\BasePriceController;
use App\Http\Controllers\Admin\CategoryController;

/*
|--------------------------------------------------------------------------
| Rutas públicas
|--------------------------------------------------------------------------
*/

Route::view('/', 'configurador');
Route::get('/test', [CategoryController::class, 'configurador']);
Route::view('/registro', 'register');
Route::view('/inicio-sesion', 'login');

/*
|--------------------------------------------------------------------------
| Login con Google
|--------------------------------------------------------------------------
*/

Route::get('/google-auth/redirect', function () {
    return Socialite::driver('google')->redirect();
});

Route::get('/google-auth/callback', function () {
    $user_google = Socialite::driver('google')->stateless()->setHttpClient(new \GuzzleHttp\Client(['verify' => false]))->user();

    $user = User::updateOrCreate([
        'google_id' => $user_google->id,
    ], [
        'name' => $user_google->name,
        'email' => $user_google->email,
    ]);

    Auth::login($user);

    return redirect()->intended('admin/dashboard');
});

/*
|--------------------------------------------------------------------------
| Rutas para usuarios autenticados normales
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    Route::post('/house-configurations', [HouseConfigurationController::class, 'store']);
});

/*
|--------------------------------------------------------------------------
| Rutas para administradores
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', AdminMiddleware::class])
    ->prefix('admin')
    ->name('admin.')
    ->group(function () {
        Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('admin.dashboard'); 
        Route::resource('products', ProductController::class)->names('products');
        Route::resource('categories', CategoryController::class)->names('categories');
        

        Route::resource('leads', LeadController::class)->names('leads');
        Route::get('/casas-creadas', [HouseConfigurationController::class, 'index'])->name('admin.houses.index');
        Route::resource('/precios-base', BasePriceController::class)
                ->parameters(['precios-base' => 'basePrice'])
                ->except(['create', 'show', 'edit']);

    });

/*
|--------------------------------------------------------------------------
| Rutas de autenticación generadas por Laravel Breeze/Fortify/etc.
|--------------------------------------------------------------------------
*/

require __DIR__ . '/auth.php';
