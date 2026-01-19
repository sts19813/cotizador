@extends('layouts.admin')

@section('content')

    <style>
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
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
        }

        .carousel-overlay img {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        /* Flechas negras para Carousel Bootstrap */
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

    <h2>Leads del Cotizador</h2>
    <p class="text-muted">Visualiza todos los leads generados desde el cotizador</p>

    <table id="configurationsTable" class="table table-striped table-hover table-bordered align-middle">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Teléfono</th>
                <th>Lote</th>
                <th>Resumen</th>
                <th>Total</th>
                <th>Fecha</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($leads as $index => $lead)
                <tr>
                    <td>LEAD{{ str_pad($index + 1, 3, '0', STR_PAD_LEFT) }}</td>
                    <td>{{ $lead->nombre }} {{ $lead->apellido }}</td>
                    <td>{{ $lead->email }}</td>
                    <td>{{ $lead->telefono }}</td>
                    <td>{{ $lead->lote_nombre }}</td>
                    <td>
                        <button class="btn btn-sm btn-outline-primary ver-resumen-btn"
                            data-configuration='@json($lead->configuration)' data-miniaturas='@json($lead->miniaturas)'
                            data-precio="{{ $lead->total }}">
                            Ver resumen
                        </button>
                    </td>
                    <td class="fw-bold text-success">
                        ${{ number_format($lead->total, 0, '.', ',') }}
                    </td>
                    <td>{{ $lead->created_at->format('d/m/Y h:i A') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

    {{-- MODAL --}}
    <div class="modal fade" id="modalResumenConfig" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Resumen de Configuración</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <h5 class="mb-3">Galería</h5>

                    {{-- CAROUSEL --}}
                    <div id="carouselResumen" class="carousel slide mb-4" data-bs-ride="false">
                        <div class="carousel-inner" id="carouselResumenInner"></div>

                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselResumen"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </button>

                        <button class="carousel-control-next" type="button" data-bs-target="#carouselResumen"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </button>
                    </div>

                    <h5>Tabla de Opciones</h5>
                    <table class="table table-bordered" id="tablaResumenModal">
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
                        <span id="totalResumenModal" class="text-success fw-bold"></span>
                    </h4>

                </div>
            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script>
        $(document).ready(function () {
            $('#configurationsTable').DataTable({
                responsive: true,
                language: {
                    url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json'
                }
            });
        });
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {

            document.querySelectorAll(".ver-resumen-btn").forEach(btn => {

                btn.addEventListener("click", () => {

                    const configuration = JSON.parse(btn.dataset.configuration || "[]");
                    const miniaturas = JSON.parse(btn.dataset.miniaturas || "[]");
                    const total = btn.dataset.precio || 0;

                    const carouselInner = document.getElementById("carouselResumenInner");
                    const tbody = document.querySelector("#tablaResumenModal tbody");

                    carouselInner.innerHTML = "";
                    tbody.innerHTML = "";

                    document.getElementById("totalResumenModal").textContent =
                        "$" + Number(total).toLocaleString("es-MX");

                    // ======================
                    // CAROUSEL DE RENDERS
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
                    // TABLA RESUMEN
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
                        document.getElementById("modalResumenConfig")
                    ).show();
                });
            });
        });
    </script>
@endpush