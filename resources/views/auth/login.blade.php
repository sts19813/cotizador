<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro - UONDR</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="/assets/login.css">
</head>

<body>
    <div class="container-fluid">
        <div class="row vh-100">

            <!-- Left: Form Section -->
            <div class="col-lg-5 d-flex justify-content-center">
                <div class="form-section">
                    <img src="/img/login/logo.png" alt="" class="logo">
                    <br><br>
                    <h3 class="mb-1 fw-bold werlcomeTexr">¡Bienvenido de nuevo! 👋🏻</h3>
                    <p class="text-muted mb-4 subtitle-login">Inicia sesión para continuar</p>

                    <form class="formLogin" method="POST" action="{{ route('login') }}">
                        @csrf

                        <!-- Correo -->
                        <div class="mb-3">
                            <label for="email" class="form-label subtitle-login mb-4-login">Correo</label>
                            <input type="email" class="form-control" id="email" name="email"
                                value="{{ old('email') }}" required autofocus>
                            @error('email')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <!-- Contraseña -->
                        <div class="mb-3">
                            <label for="password" class="form-label subtitle-login mb-4-login">Contraseña</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                            @error('password')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <!-- Recordarme -->
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="remember_me" name="remember">
                            <label class="form-check-label" for="remember_me">Recordarme</label>
                        </div>

                        <!-- Enlace para recuperar contraseña -->
                        @if (Route::has('password.request'))
                            <div class="mb-3 text-end">
                                <a class="text-decoration-none text-muted" href="{{ route('password.request') }}">
                                    ¿Olvidaste tu contraseña?
                                </a>
                            </div>
                        @endif

                        <!-- Botón de login -->
                        <button type="submit" class="btn btn-primary w-100 mb-3 btn-registrar">Iniciar sesión</button>

                         <div class="text-center text-muted my-3">O inicia sesión con</div>
                    <div class="d-flex justify-content-center gap-3 mb-3">
                        <a href="/google-auth/redirect?redirect={{ request('redirect') }}" class="btn btn-outline-secondary w-100 btn-login-google">
                            <img src="https://img.icons8.com/color/16/000000/google-logo.png" /> Google
                        </a>
                        <!--
                        <a class="btn btn-outline-secondary w-100 btn-login-google">
                            <img src="https://img.icons8.com/ios-filled/16/000000/mac-os.png" /> Apple
                        </a>
                        -->
                    </div>
                    </form>

                   

                    <p class="text-center text-muted">¿No tienes cuenta aún?
                        <a href="/registro" class="text-decoration-none">Regístrate</a>
                    </p>
                </div>
            </div>

            <!-- Right: Image Section -->
            <div class="containerimg col-lg-7">
                <div class="d-none d-lg-block img-section">
                    <!-- Imagen decorativa opcional -->
                </div>
            </div>
        </div>
    </div>
</body>
</html>
