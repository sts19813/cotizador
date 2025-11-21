@extends('layouts.admin')


@section('content')

    <style>
        .item-badge {
            display: inline-block;
            font-size: 0.75rem;
            padding: 4px 8px;
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.9);
            color: #111;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        /* Modo oscuro */
        body.dark-mode .item-badge {
            background: rgba(255, 255, 255, 0.1);
            color: #f1f1f1;
            border: 1px solid rgba(255, 255, 255, 0.15);
        }
    </style>

    <h2>Casas Creadas</h2>
    <p class="text-muted">Visualiza todas las casas creadas en el cotizador</p>

    <table id="configurationsTable" class="table table-striped table-hover table-bordered align-middle">
        <thead>
            <tr>
                <th>ID Casa</th>
                <th>Nombre</th>
                <th>Email</th>
                <th>Items Seleccionados</th>
                <th>Total Estimado</th>
                <th>Estatus</th>
                <th>Fecha Creación</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($configurations as $index => $config)
                <tr>
                    <td>MIN{{ str_pad($index + 1, 2, '0', STR_PAD_LEFT) }}</td>
                    <td>{{ $config->user->name }}</td>
                    <td>{{ $config->user->email }}</td>
                    <td>
                        <button class="btn btn-sm btn-outline-primary ver-resumen-btn"
                            data-configuration='@json($config->configuration)' data-miniaturas='@json($config->miniaturas_data)'
                            data-precio="{{ $config->precio_total }}">
                            Ver resumen
                        </button>
                    </td>
                    <td>
                        <span class="text-success fw-bold">
                            ${{ number_format($config->precio_total, 0, '.', ',') }}
                        </span>
                    </td>
                    <td>
                        <span class="badge bg-{{ $config->status === 'Solicitada' ? 'primary' : 'secondary' }}">
                            {{ $config->status }}
                        </span>
                    </td>
                    <td><i class="bi bi-calendar"></i> {{ $config->created_at->format('d/m/Y h:i A') }} </td>
                </tr>
            @endforeach
        </tbody>
    </table>


    <div class="modal fade" id="modalResumenConfig" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Resumen de Configuración</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <h5>Render Principal</h5>
                    <div id="renderPrincipalModal" class="mb-4"></div>

                    <h5>Miniaturas</h5>
                    <div id="miniaturasModal" class="d-flex gap-2 mb-4"></div>

                    <h5>Tabla de Opciones</h5>
                    <table class="table table-bordered" id="tablaResumenModal">
                        <thead>
                            <tr>
                                <th>Categoría</th>
                                <th>Opción</th>
                                <th>Código</th>
                                <th>Imagen</th>
                                <th>Precio</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                    <h4 class="mt-3">Total:
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
                autoWidth: false,
                language: {
                    url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json'
                },
                dom:
                    "<'row mb-3'<'col-12 d-flex justify-content-end'f>>" + // buscador arriba derecha
                    "<'row'<'col-12'tr>>" +                               // tabla
                    "<'row mt-3'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'p>>", // info y paginación
            });
        });      
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", () => {

            document.querySelectorAll(".ver-resumen-btn").forEach(btn => {

                btn.addEventListener("click", () => {

                    const configuration = JSON.parse(btn.dataset.configuration);
                    const miniaturasData = JSON.parse(btn.dataset.miniaturas);
                    const precioTotal = btn.dataset.precio;

                    // ==========================
                    // LIMPIAR MODAL
                    // ==========================
                    document.querySelector("#renderPrincipalModal").innerHTML = "";
                    document.querySelector("#miniaturasModal").innerHTML = "";
                    document.querySelector("#tablaResumenModal tbody").innerHTML = "";
                    document.querySelector("#totalResumenModal").textContent = "$" +
                        parseFloat(precioTotal).toLocaleString("es-MX");

                    // ==========================
                    // RENDER PRINCIPAL
                    // ==========================
                    if (miniaturasData.length > 1) {
                        const item = miniaturasData[1];

                        const wrapper = document.createElement("div");
                        wrapper.style.position = "relative";

                        const imgBase = document.createElement("img");
                        imgBase.src = item.base;
                        imgBase.className = "img-fluid rounded";
                        wrapper.appendChild(imgBase);

                        if (item.overlays.length > 0) {
                            const overlayDiv = document.createElement("div");
                            overlayDiv.style.position = "absolute";
                            overlayDiv.style.top = "0";
                            overlayDiv.style.left = "0";
                            overlayDiv.style.width = "100%";
                            overlayDiv.style.height = "100%";
                            overlayDiv.style.pointerEvents = "none";

                            item.overlays.forEach(src => {
                                const imgOverlay = document.createElement("img");
                                imgOverlay.src = src;
                                imgOverlay.style.width = "100%";
                                imgOverlay.style.height = "100%";
                                imgOverlay.style.position = "absolute";
                                overlayDiv.appendChild(imgOverlay);
                            });

                            wrapper.appendChild(overlayDiv);
                        }

                        document.querySelector("#renderPrincipalModal").appendChild(wrapper);
                    }

                    // ==========================
                    // MINIATURAS
                    // ==========================
                    miniaturasData.forEach(item => {
                        const wrapper = document.createElement("div");
                        wrapper.style.position = "relative";
                        wrapper.style.width = "120px";

                        const imgBase = document.createElement("img");
                        imgBase.src = item.base;
                        imgBase.className = "img-fluid rounded";
                        wrapper.appendChild(imgBase);

                        if (item.overlays.length > 0) {
                            const overlayDiv = document.createElement("div");
                            overlayDiv.style.position = "absolute";
                            overlayDiv.style.top = "0";
                            overlayDiv.style.left = "0";
                            overlayDiv.style.width = "100%";
                            overlayDiv.style.height = "100%";
                            overlayDiv.style.pointerEvents = "none";

                            item.overlays.forEach(src => {
                                const imgOverlay = document.createElement("img");
                                imgOverlay.src = src;
                                imgOverlay.style.width = "100%";
                                imgOverlay.style.height = "100%";
                                imgOverlay.style.position = "absolute";
                                overlayDiv.appendChild(imgOverlay);
                            });

                            wrapper.appendChild(overlayDiv);
                        }

                        document.querySelector("#miniaturasModal").appendChild(wrapper);
                    });

                    // ==========================
                    // TABLA DE RESUMEN
                    // ==========================
                    Object.entries(configuration).forEach(([key, item]) => {

                        const precio = parseFloat(item.precio || item.precio_a || item.precio_b || 0);

                        const row = `
                        <tr>
                            <td>${item.categoria ?? ""}</td>
                            <td>${item.valor ?? ""}</td>
                            <td>${item.pre_code ?? ""} ${item.variant_code ?? ""}</td>
                            <td>
                                ${item.img ?? ""}
                            </td>
                            <td>
                                ${precio === 0
                                ? ''
                                : '$' + precio.toLocaleString("es-MX")
                            }
                            </td>
                        </tr>
                    `;

                        document.querySelector("#tablaResumenModal tbody")
                            .insertAdjacentHTML("beforeend", row);
                    });

                    // ==========================
                    // ABRIR MODAL
                    // ==========================
                    const modal = new bootstrap.Modal(document.getElementById("modalResumenConfig"));
                    modal.show();

                });
            });

        });
    </script>

@endpush