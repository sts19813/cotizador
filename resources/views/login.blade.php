<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro - UONDR</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', sans-serif;
        }

        .formLogin {
            width: 390px;
        }

        .form-section {
            max-width: 500px;
            margin: auto;
            padding: 30px 30px;
        }

        .btn-primary {
            background-color: #2962FF;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0039cb;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #2962FF;
        }

        .img-section {
            background: url('img/login/login.jpg') no-repeat center center;
            background-size: cover;
            height: 93vh;
            border-radius: 25px;
        }

        .logo {
            width: 200px;
        }

        .brand {
            font-weight: bold;
            font-size: 1.8rem;
            color: #2962FF;
        }

        .containerimg {
            padding: 30px;
        }

        .form-label {
            font-weight: 400;
            color: #A1A1A1 !important;
            margin-bottom: 0px !important;
        }

        .btn-registrar {
            border-radius: 25px;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="row vh-100">

            <!-- Left: Form Section -->
            <div class="col-lg-5 d-flex  justify-content-center">
                <div class="form-section">
                    <img src="/img/login/logo.png" alt="" class="logo">
                    <br><br>
                    <h3 class="mb-1 fw-bold">¡Bienvenido! 👋🏻</h3>
                    <p class="text-muted mb-4">Crea tu cuenta para guardar tu casa</p>

                    <form class="formLogin">
                        <div class="mb-3">
                            <label for="name" class="form-label">Nombre</label>
                            <input type="text" class="form-control" id="name" placeholder="Nombre" value="Perry Wilson">
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Correo</label>
                            <input type="email" class="form-control" id="email" placeholder="Correo" value="perry.wilson@example.com">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Contraseña</label>
                            <input type="password" class="form-control" id="password" placeholder="Contraseña" value="••••••••">
                        </div>

                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="terms" checked>
                            <label class="form-check-label" for="terms">Acepto los <strong>Términos y condiciones</strong></label>
                        </div>

                        <button type="submit" class="btn btn-primary w-100 mb-3  btn-registrar">Registrarme</button>
                    </form>


                    <div class="text-center text-muted my-3">O inicia sesión con</div>
                    <div class="d-flex justify-content-center gap-3 mb-3">
                        <button class="btn btn-outline-secondary w-100"><img src="https://img.icons8.com/color/16/000000/google-logo.png" /> Google</button>
                        <button class="btn btn-outline-secondary w-100"><img src="https://img.icons8.com/ios-filled/16/000000/mac-os.png" /> Apple</button>
                    </div>

                    <p class="text-center text-muted">¿Ya tienes cuenta? <a href="#" class="text-decoration-none">Inicia Sesión</a></p>
                </div>
            </div>

            <!-- Right: Image Section -->
            <div class="containerimg col-lg-7">
                <div class=" d-none d-lg-block img-section">

                </div>
            </div>
        </div>
    </div>

</body>

</html>