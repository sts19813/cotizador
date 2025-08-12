<!-- Header -->
<div class="d-flex justify-content-between align-items-center navbar fixed-top bg-white shadow-sm px-3 py-2 z-3">
    <button class="btn btn-outline-secondary btn-radius btn-regresar">Regresar</button>

    <!-- Logo centrado absolutamente -->
    <img src="/img/logo.svg" alt="Logo" width="210px" class="position-absolute top-50 start-50 translate-middle">

    <div class="d-flex align-items-center gap-2">
        @auth
            <!-- Botón Guardar para usuarios autenticados -->
            <button class="btn btn-outline-primary btn-radius dark-blue" id="capturar">
                Ver Resumen <i class="bi bi-bookmark"></i>
            </button>

            <!-- Dropdown con nombre de usuario -->
            <div class="dropdown d-inline-block">
                <button class="btn btn-outline-primary dropdown-toggle btn-radius dark-blue" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                    {{ Auth::user()->name }}
                </button>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                    <li>
                        <a class="dropdown-item" href="{{ route('profile.edit') }}">
                            <i class="bi bi-person-circle me-1"></i> Perfil
                        </a>
                    </li>
                    <li>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit" class="dropdown-item">
                                <i class="bi bi-box-arrow-right me-1"></i> Cerrar sesión
                            </button>
                        </form>
                    </li>
                </ul>
            </div>
        @else
            <!-- Botón Guardar para visitantes, redirige a login -->
            <button class="btn btn-outline-primary btn-radius dark-blue" onclick="window.location.href='/inicio-sesion'">
                Guardar <i class="bi bi-bookmark"></i>
            </button>

            <!-- Botón Crear cuenta -->
            <a href="/registro" class="btn btn-primary btn-radius">
                Crear Cuenta <i class="bi bi-person"></i>
            </a>
        @endauth
    </div>
</div>