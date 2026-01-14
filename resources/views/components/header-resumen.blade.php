<!-- Header Resumen -->
<!-- Google Tag Manager (noscript) -->
<noscript>
    <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RT6K3RZ"
            height="0"
            width="0"
            style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->

<style>
    #mainNav {
        height: 72px;
    }

    .btn-save-icon {
        width: 42px;
        height: 42px;
        padding: 0;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>

<nav id="mainNav" class="navbar fixed-top bg-white shadow-sm px-3 py-2 z-3">
    <div class="container-fluid d-flex justify-content-between align-items-center position-relative">

        <!-- Regresar -->
        <div class="d-flex align-items-center">
            <a href="javascript:history.back()">
                <img src="/assets/iconos/regresar.svg" width="34" alt="Regresar">
            </a>
        </div>

        <!-- Logo centrado -->
        <img src="/img/logo.svg"
             alt="Logo"
             width="200"
             class="position-absolute top-50 start-50 translate-middle">

        <!-- Acciones derecha -->
        <div class="d-flex align-items-center gap-2">

            <!-- Desktop: Guardar + Perfil -->
            <div class="d-none d-md-flex align-items-center gap-2">
                @auth
                    <button type="button"
                            class="btn btn-primary btn-save-icon"
                            onclick="guardarFlujo()"
                            title="Guardar configuración">
                        <i class="bi bi-bookmark"></i>
                    </button>

                    <div class="dropdown">
                        <button class="btn btn-light p-2"
                                id="userDropdown"
                                data-bs-toggle="dropdown">
                            <i class="bi bi-person fs-5"></i>
                        </button>

                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <a class="dropdown-item" href="/house-configurations/list">
                                    <i class="bi bi-person-circle me-2"></i> Perfil
                                </a>
                            </li>
                            <li>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf
                                    <button type="submit" class="dropdown-item">
                                        <i class="bi bi-box-arrow-right me-2"></i> Cerrar sesión
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                @else
                    <a href="/registro" class="btn btn-primary btn-radius">
                        Crear cuenta
                    </a>
                @endauth
            </div>

            <!-- Mobile: Hamburguesa -->
            <button class="navbar-toggler d-md-none"
                    type="button"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#mobileMenuResumen">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
    </div>
</nav>

<!-- Offcanvas móvil -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="mobileMenuResumen">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title">Menú</h5>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
    </div>

    <div class="offcanvas-body d-flex flex-column gap-3">

        @auth
            <button class="btn btn-primary" onclick="guardarFlujo()">
                <i class="bi bi-bookmark me-2"></i> Guardar configuración
            </button>

            <a href="/house-configurations/list" class="btn btn-outline-primary">
                <i class="bi bi-person-circle me-2"></i> Perfil
            </a>

            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button class="btn btn-outline-danger w-100">
                    <i class="bi bi-box-arrow-right me-2"></i> Cerrar sesión
                </button>
            </form>
        @else
            <a href="/registro" class="btn btn-primary">
                Crear cuenta
            </a>
        @endauth
    </div>
</div>
