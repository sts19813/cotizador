<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

    <x-header />

    <style>
        #mainNav .capturar,
        #mainNav .align-items-center .d-md-inline {
            display: none !important;
        }

        /* ===============================
       CAROUSEL BASE + OVERLAYS
    =============================== */
        .carousel-render-wrapper {
            position: relative;
            width: 100%;
        }

        .carousel-render-wrapper img {
            width: 100%;
            height: auto;
            display: block;
        }

        .carousel-overlay {
            position: absolute;
            inset: 0;
            pointer-events: none;
        }

        .carousel-overlay img {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        /* Flechas negras */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-image: none;
            width: 2.5rem;
            height: 2.5rem;
        }

        .carousel-control-prev-icon::after,
        .carousel-control-next-icon::after {
            content: '';
            display: block;
            width: 100%;
            height: 100%;
            background-size: contain;
            background-repeat: no-repeat;
        }

        .carousel-control-prev-icon::after {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='black' viewBox='0 0 16 16'%3E%3Cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3E%3C/svg%3E");
        }

        .carousel-control-next-icon::after {
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='black' viewBox='0 0 16 16'%3E%3Cpath d='M4.646 14.354a.5.5 0 0 1 0-.708L10.293 8 4.646 2.354a.5.5 0 1 1 .708-.708l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708 0z'/%3E%3C/svg%3E");
        }
    </style>

    <div class="container py-5">
        <br><br><br>

        <h2 class="fw-bold text-center mb-5">
            Hola, {{ Auth::user()->name }}
        </h2>

        <div class="row g-4">
            @foreach ($configurations as $index => $config)
                <div class="card mb-4">
                    <div class="row g-0 align-items-center">

                        {{-- PREVIEW --}}
                        <div class="col-md-6">
                            @php
                                $miniaturas = $config->miniaturas_data ?? [];
                                $item = $miniaturas[1] ?? null;
                            @endphp

                            @if ($item)
                                <div style="position: relative;">
                                    <img src="{{ $item['base'] }}" class="img-fluid rounded-4">
                                    @if (!empty($item['overlays']))
                                        @foreach ($item['overlays'] as $overlay)
                                            <img src="{{ $overlay }}"
                                                style="position:absolute; inset:0; width:100%; height:100%; pointer-events:none;">
                                        @endforeach
                                    @endif
                                </div>
                            @else
                                <img src="/img/minimalista.jpg" class="img-fluid rounded-4">
                            @endif
                        </div>

                        {{-- INFO --}}
                        <div class="col-md-6">
                            <div class="card-body">
                                <table class="table table-borderless mb-0">
                                    <tbody>
                                        <tr>
                                            <th class="ps-0">Folio</th>
                                            <td class="text-end pe-0">#{{ $config->id }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Fecha</th>
                                            <td class="text-end pe-0">
                                                {{ $config->created_at->format('d/m/Y h:i A') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Estilo</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['opciones-casas']['valor'] ?? '' }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Recámaras</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['Habitaciones']['valor'] ?? '' }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Precio</th>
                                            <td class="text-end pe-0">
                                                ${{ number_format($config->precio_total ?? 0, 0, '.', ',') }}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn btn-primary mt-2 ver-resumen-user"
                                    data-configuration='@json($config->configuration)'
                                    data-miniaturas='@json($config->miniaturas_data)'
                                    data-precio="{{ $config->precio_total }}">
                                    Ver resumen
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    <x-footer />
    <x-scripts />

    {{-- MODAL --}}
    <div class="modal fade" id="modalResumenUsuario" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Resumen de Configuración</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <h5 class="mb-3">Galería</h5>

                    <div id="carouselResumenUsuario" class="carousel slide mb-4" data-bs-ride="false">
                        <div class="carousel-inner" id="carouselResumenUsuarioInner"></div>

                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselResumenUsuario"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>

                        <button class="carousel-control-next" type="button" data-bs-target="#carouselResumenUsuario"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>

                    <h5>Tabla de Opciones</h5>
                    <table class="table table-bordered" id="tablaResumenUsuario">
                        <thead>
                            <tr>
                                <th>Categoría</th>
                                <th>Opción</th>
                                <th>Código</th>
                                <th>Precio</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                    <h4 class="mt-3">
                        Total:
                        <span id="totalResumenUsuario" class="text-success fw-bold"></span>
                    </h4>

                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", () => {

            document.querySelectorAll(".ver-resumen-user").forEach(btn => {

                btn.addEventListener("click", () => {

                    const configuration = JSON.parse(btn.dataset.configuration || "[]");
                    const miniaturas = JSON.parse(btn.dataset.miniaturas || "[]");
                    const total = btn.dataset.precio || 0;

                    const carouselInner = document.getElementById("carouselResumenUsuarioInner");
                    const tbody = document.querySelector("#tablaResumenUsuario tbody");

                    carouselInner.innerHTML = "";
                    tbody.innerHTML = "";

                    document.getElementById("totalResumenUsuario").textContent =
                        "$" + Number(total).toLocaleString("es-MX");

                    // ======================
                    // CAROUSEL
                    // ======================
                    miniaturas.forEach((item, index) => {

                        const slide = document.createElement("div");
                        slide.className = "carousel-item" + (index === 0 ? " active" : "");

                        const wrapper = document.createElement("div");
                        wrapper.className = "carousel-render-wrapper";

                        const base = document.createElement("img");
                        base.src = item.base;
                        base.className = "img-fluid rounded";
                        wrapper.appendChild(base);

                        if (item.overlays?.length) {
                            const overlay = document.createElement("div");
                            overlay.className = "carousel-overlay";

                            item.overlays.forEach(src => {
                                const img = document.createElement("img");
                                img.src = src;
                                overlay.appendChild(img);
                            });

                            wrapper.appendChild(overlay);
                        }

                        slide.appendChild(wrapper);
                        carouselInner.appendChild(slide);
                    });

                    // ======================
                    // TABLA
                    // ======================
                    Object.values(configuration).forEach(item => {

                        if (!item?.categoria || !item?.valor) return;

                        const precio = Number(
                            item.precio ?? item.precio_a ?? item.precio_b ?? 0
                        );

                        const codigo = [
                            item.pre_code ?? "",
                            item.variant_code ?? ""
                        ].join(" ").trim();

                        tbody.insertAdjacentHTML("beforeend", `
                    <tr>
                        <td>${item.categoria}</td>
                        <td>${item.valor}</td>
                        <td>${codigo}</td>
                        <td>${precio > 0 ? '$' + precio.toLocaleString("es-MX") : ''}</td>
                    </tr>
                `);
                    });

                    new bootstrap.Modal(
                        document.getElementById("modalResumenUsuario")
                    ).show();
                });
            });
        });
    </script>

</body>

</html>