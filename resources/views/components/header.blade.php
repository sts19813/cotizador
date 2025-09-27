<!-- Header -->
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RT6K3RZ"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<nav class="navbar fixed-top bg-white shadow-sm px-3 py-2 z-3">
    <div class="container-fluid d-flex justify-content-between align-items-center position-relative">

        <!-- Botones Regresar y Volver a empezar (izquierda en móvil y escritorio) -->
        <div class="d-flex align-items-center gap-2">
            <a href="https://uondr.mx/" class="btn btn-outline-primary btn-radius dark-blue">
                Regresar
            </a>
            <a href="/" class="btn btn-outline-primary btn-radius dark-blue d-none d-md-inline">
                Volver a empezar
            </a>
        </div>

        <!-- Logo centrado siempre -->
        <img src="/img/logo.svg" alt="Logo" width="210px" class="position-absolute top-50 start-50 translate-middle logo-mobile">

        <!-- Botón hamburguesa solo en móvil -->
        <button class="navbar-toggler d-md-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobileMenu" aria-controls="mobileMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Opciones de escritorio -->
        <div class="d-none d-md-flex align-items-center gap-2">
            @auth
                <button class="btn btn-outline-primary btn-radius dark-blue capturar">
                    Ver Resumen <i class="bi bi-bookmark"></i>
                </button>

                <div class="dropdown d-inline-block">
                    <button class="btn btn-outline-primary dropdown-toggle btn-radius dark-blue" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        {{ Auth::user()->name }}
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li>
                            <a class="dropdown-item" href="/house-configurations/list">
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
                <button class="btn btn-outline-primary btn-radius dark-blue capturar">
                    Ver Resumen <i class="bi bi-bookmark"></i>
                </button>
                <a href="/registro" class="btn btn-primary btn-radius">
                    Crear Cuenta <i class="bi bi-person"></i>
                </a>
            @endauth
        </div>
    </div>
</nav>

<!-- Offcanvas menú para móvil -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenu" aria-labelledby="mobileMenuLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="mobileMenuLabel">Menú</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body d-flex flex-column gap-2">
          <a href="/" class="btn btn-outline-primary btn-radius dark-blue">Volver a empezar</a>
        @auth
            <button class="btn btn-outline-primary btn-radius dark-blue capturar">
                Ver Resumen <i class="bi bi-bookmark"></i>
            </button>
            <a href="/house-configurations/list" class="btn btn-outline-primary btn-radius dark-blue">
                Perfil <i class="bi bi-person-circle"></i>
            </a>
           <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="btn btn-outline-primary btn-radius dark-blue w-100 mb-2">
                    Cerrar sesión <i class="bi bi-box-arrow-right"></i>
                </button>
            </form>
        @else
            <button class="btn btn-outline-primary btn-radius dark-blue capturar">
                Ver Resumen <i class="bi bi-bookmark"></i>
            </button>
            <a href="/registro" class="btn btn-primary btn-radius dark-blue">
                Crear Cuenta <i class="bi bi-person"></i>
            </a>
        @endauth
        
    </div>
</div>
