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
use App\Http\Controllers\Admin\RenderController;
use App\Http\Controllers\Admin\LeadController;
use App\Http\Controllers\Admin\BasePriceController;
use App\Http\Controllers\Admin\CategoryController;
use Illuminate\Foundation\Exceptions\Renderer\Renderer;

/*
|--------------------------------------------------------------------------
| Rutas públicas
|--------------------------------------------------------------------------
*/


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

    return redirect()->intended('/resumen');
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
    Route::get('/house-configurations/list', [HouseConfigurationController::class, 'list'])->name('house-configurations.list');
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
        Route::get('/', [AdminController::class, 'dashboard'])->name('dashboard');
        Route::resource('products', ProductController::class)->names('products');
        Route::get('renders/{style?}', [RenderController::class, 'index'])
            ->name('renders.index');

        Route::put('renders/{id}', [RenderController::class, 'update'])->name('renders.update');
    
        Route::resource('categories', CategoryController::class)->names('categories');
        Route::post('categories/reorder', [CategoryController::class, 'reorder'])->name('categories.reorder');

        Route::resource('leads', LeadController::class)->names('leads');
        Route::get('/casas-creadas', [HouseConfigurationController::class, 'index'])->name('houses.index');
        Route::resource('/precios-base', BasePriceController::class)
                ->parameters(['precios-base' => 'basePrice'])
                ->except(['create', 'show', 'edit']);

          // Mostrar productos por estilo para edición masiva
        Route::get('products/prices/{style}', [ProductController::class, 'showByStyle'])
            ->name('products.prices.byStyle');

        // Guardado masivo de precios por estilo
        Route::put('products/update-mass/{style}', [ProductController::class, 'updateMassPrices'])
            ->name('products.update-mass');
    });

/*
|--------------------------------------------------------------------------
| Rutas de autenticación generadas por Laravel Breeze/Fortify/etc.
|--------------------------------------------------------------------------
*/

Route::view('/unauthorized', 'unauthorized')->name('unauthorized');

Route::get('/resumen', [CategoryController::class, 'resumen']);
Route::view('/registro', 'register');
Route::view('/inicio-sesion', 'login');
Route::get('/login', function () {
    return redirect('/inicio-sesion');
});
Route::view('/test/{style?}', 'configurador');
Route::get('/{style?}', [CategoryController::class, 'configurador']);

require __DIR__ . '/auth.php';
