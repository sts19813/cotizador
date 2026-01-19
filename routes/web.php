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
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductFachadaController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\NewPasswordController;
use App\Http\Controllers\Auth\PasswordResetLinkController;
use App\Http\Controllers\Auth\RegisteredUserController;


Route::get('/lang/{lang}', function ($lang) {
    session(['locale' => $lang]);
    return back();
})->name('lang.switch');

/*
|--------------------------------------------------------------------------
| Login con Google
|--------------------------------------------------------------------------
*/
Route::get('/google-auth/redirect', function () {
    if (request()->has('redirect')) {
        session(['redirect_after_login' => request()->get('redirect')]);
    }
    return Socialite::driver('google')->redirect();
});

Route::get('/google-auth/callback', function () {
    $user_google = Socialite::driver('google')
        ->stateless()
        ->setHttpClient(new \GuzzleHttp\Client(['verify' => false]))
        ->user();

    $user = User::updateOrCreate(
        ['google_id' => $user_google->id],
        ['name' => $user_google->name, 'email' => $user_google->email]
    );

    Auth::login($user);

    $redir = session('redirect_after_login', null);
    session()->forget('redirect_after_login');

    if ($redir === 'guardar') {
        return redirect('/resumen?autoguardar=1');
    }

    return redirect()->intended($redir ?? '/resumen');
});

/*
|--------------------------------------------------------------------------
| Rutas para invitados (guest)
|--------------------------------------------------------------------------
*/
Route::middleware('guest')->group(function () {
    Route::get('register', [RegisteredUserController::class, 'create'])->name('register');
    Route::post('register', [RegisteredUserController::class, 'store']);

    Route::get('inicio-sesion', [AuthenticatedSessionController::class, 'create'])->name('login');
    Route::post('inicio-sesion', [AuthenticatedSessionController::class, 'store']);

    Route::get('forgot-password', [PasswordResetLinkController::class, 'create'])->name('password.request');
    Route::post('forgot-password', [PasswordResetLinkController::class, 'store'])->name('password.email');

    Route::get('reset-password/{token}', [NewPasswordController::class, 'create'])->name('password.reset');
    Route::post('reset-password', [NewPasswordController::class, 'store'])->name('password.store');
});

/*
|--------------------------------------------------------------------------
| Rutas para usuarios autenticados
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

        Route::get('/solicitudes', [HouseConfigurationController::class, 'requests'])->name('houses.requests');

        // Mostrar productos por estilo para edición masiva
        Route::get('products/prices/{style}', [ProductController::class, 'showByStyle'])
            ->name('products.prices.byStyle');

        // Guardado masivo de precios por estilo
        Route::put('products/update-mass/{style}', [ProductController::class, 'updateMassPrices'])
            ->name('products.update-mass');

        //perfil administrador
        Route::get('/perfil', [ProfileController::class, 'index'])->name('profile.index');
        Route::post('/perfil/actualizar', [ProfileController::class, 'updateAdmin'])->name('profile.update');
        Route::post('/perfil/foto', [ProfileController::class, 'updatePhoto'])->name('profile.update.photo');
        Route::post('/perfil/password', [ProfileController::class, 'updatePassword'])->name('profile.update.password');

        //precios base
        Route::get('/precio/fachadas', [ProductFachadaController::class, 'index'])
            ->name('precio.fachadas');

        Route::post('/precio/fachadas/update/{product}', [ProductFachadaController::class, 'update'])
            ->name('precio.fachadas.update');

    });

/*
|--------------------------------------------------------------------------
| Otras rutas normales
|--------------------------------------------------------------------------
*/

Route::post('/leads', [LeadController::class, 'storeLead']);
Route::view('/unauthorized', 'unauthorized')->name('unauthorized');
Route::get('/resumen', [CategoryController::class, 'resumen']);
Route::view('/registro', 'register');
Route::view('/test/{style?}', 'configurador');
Route::get('/{style?}', [CategoryController::class, 'configurador']);

require __DIR__ . '/auth.php';
