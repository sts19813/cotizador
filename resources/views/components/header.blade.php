<!-- Header -->
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-5RT6K3RZ" height="0" width="0"
        style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


<style>
    #mainNav {
        transition: transform 0.25s ease;
    }

    #mainNav.nav-hidden {
        transform: translateY(-100%);
    }
    .uondr-modal {
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.65);
    display: none;
    align-items: center;
    justify-content: center;
    z-index: 9999;
}

.uondr-modal.show {
    display: flex;
}

.uondr-modal-content {
    background: #fff;
    max-width: 720px;
    width: 90%;
    padding: 40px;
    border-radius: 16px;
    position: relative;
    font-family: 'Inter', sans-serif;
}

.uondr-close {
    position: absolute;
    top: 18px;
    right: 20px;
    background: none;
    border: none;
    font-size: 28px;
    cursor: pointer;
}

.uondr-header {
    text-align: center;
    margin-bottom: 25px;
}

.uondr-logo {
    height: 40px;
    margin-bottom: 10px;
}

.uondr-header h2 {
    font-size: 22px;
    font-weight: 700;
}

.uondr-body {
    font-size: 15px;
    line-height: 1.6;
    color: #333;
}

.uondr-body .intro {
    margin-bottom: 15px;
}

.uondr-body ol {
    padding-left: 18px;
}

.uondr-body li {
    margin-bottom: 15px;
}

.uondr-body strong {
    font-weight: 700;
}

.footer-text {
    margin-top: 20px;
    font-size: 14px;
    color: #555;
}

</style>
<nav id="mainNav" class="navbar fixed-top bg-white shadow-sm px-3 py-2 z-3">
    <div class="container-fluid d-flex justify-content-between align-items-center position-relative">

        <!-- Botones Regresar y Volver a empezar (izquierda en móvil y escritorio) -->
        <div class="d-flex align-items-center gap-2">

            <a href="https://uondr.mx/" id="btnRegresar">
                <img src="/assets/iconos/regresar.svg" alt="icono de regresar" width="34px">
            </a>

            <!--
            <a href="/" class="btn btn-outline-primary btn-radius dark-blue d-none d-md-inline">
                Volver a empezar
            -->
            </a>
        </div>

        <!-- Logo centrado siempre -->
        <img src="/img/logo.svg" alt="Logo" width="210px"
            class="position-absolute top-50 start-50 translate-middle logo-mobile">

        <!-- Botón hamburguesa solo en móvil -->
        <button class="navbar-toggler d-md-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobileMenu"
            aria-controls="mobileMenu">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Opciones de escritorio -->
        <div class="d-none d-md-flex align-items-center gap-2">
            <a href="#" class="modal-reload">
                <img src="/assets/iconos/recargar.svg" alt="icono de recargar" width="34px">
            </a>


            <a href="#" class="modal-info">
                    <img src="/assets/iconos/info.svg" alt="icono de info" width="34px">
            </a>
            <!--
            @auth

            
                <button class="btn btn-outline-primary btn-radius dark-blue capturar">
                    Ver Resumen <i class="bi bi-bookmark"></i>
                </button>
            
                


                <div class="dropdown d-inline-block">
                    <button class="btn btn-outline-primary dropdown-toggle btn-radius dark-blue" type="button"
                        id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
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
            -->
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
            <a href="/registro" class="btn btn-radius dark-blue">
                Crear Cuenta <i class="bi bi-person"></i>
            </a>
        @endauth

    </div>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        const nav = document.getElementById("mainNav");
        const preview = document.getElementById("mainPreview");
        let lastScroll = 0;

        window.addEventListener("scroll", function () {
            const currentScroll = window.pageYOffset;

            if (window.innerWidth <= 768) {

                if (currentScroll > lastScroll && currentScroll > 50) {
                    nav.classList.add("nav-hidden");
                    preview.style.marginTop = "0px"; // ⬆️ Subir preview
                } else {
                    nav.classList.remove("nav-hidden");
                    preview.style.marginTop = "80px"; // ⬇️ Bajar preview
                }
            }

            lastScroll = currentScroll;
        });
    });
</script>


<!-- MODAL UONDR -->
<div id="uondrModal" class="uondr-modal">
    <div class="uondr-modal-content">
        <button class="uondr-close">&times;</button>

        <div class="uondr-header">
            <img src="/img/logo.svg" alt="UONDR" class="uondr-logo">
            <h2>¿Cómo funciona UONDR?</h2>
        </div>

        <div class="uondr-body">
            <p class="intro">Sigue estos sencillos pasos para crear tu proyecto:</p>

            <ol>
                <li>
                    <strong>Configura tu casa</strong><br>
                    Selecciona el modelo y personaliza tu casa eligiendo los acabados y opciones disponibles.
                    Algunas configuraciones pueden modificar el precio final.
                </li>

                <li>
                    <strong>Define tu lote en Piaro</strong><br>
                    Indica si ya cuentas con un lote en Piaro o, si aún no lo tienes, agrega uno a tu proyecto para
                    continuar con la cotización.
                </li>

                <li>
                    <strong>Revisa tu proyecto</strong><br>
                    Accede a un resumen completo donde podrás ver tu casa configurada y el lote seleccionado,
                    junto con sus opciones y planes de financiamiento.
                </li>

                <li>
                    <strong>Asesoría personalizada</strong><br>
                    Agenda una llamada con nuestro equipo para recibir atención personalizada, resolver dudas
                    y avanzar en la formalización de tu proyecto.
                </li>
            </ol>

            <p class="footer-text">
                Durante esta etapa podrás apartar tu lote y cotizar tu casa, asegurando precios y disponibilidad vigentes.
            </p>
        </div>
    </div>
</div>
<!-- MODAL REINICIAR CONFIGURACIÓN -->
<div id="reloadModal" class="uondr-modal">
    <div class="uondr-modal-content text-center" style="max-width: 422px;padding: 63px;">

        <button class="uondr-close">&times;</button>

        <h2 style="font-size: 20px; font-weight: 700; margin-bottom: 25px;">
            ¿Quieres reiniciar tu configuración?
        </h2>

        <div class="d-flex justify-content-center gap-3">
            <button id="btnReloadAccept" class="btn btn-primary btn-radius">
                Aceptar
            </button>

            <button id="btnReloadCancel" class="btn btn-outline-primary btn-radius dark-blue">
                No
            </button>
        </div>

    </div>
</div>
