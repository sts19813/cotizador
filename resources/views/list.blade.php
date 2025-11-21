<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

    <x-header />
    <style>
        #mainNav .capturar, #mainNav .align-items-center .d-md-inline{
            display: none !important;
        }
    </style>

    <div class="container py-5">

        <br><br><br>

        <h2 class="fw-bold text-center mb-5">Hola,  {{ Auth::user()->name }}</h2>

        <div class="row g-4">
            @foreach ($configurations as $index => $config)
                <div class="card mb-4">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-6">
                            <div id="principalRender{{ $index }}" class="imagen-casa animar-subida" style="padding-top: 0px !important">
                                @php
                                    $miniaturas = $config->miniaturas_data ?? [];
                                    $item = $miniaturas[1] ?? null; // segunda miniatura
                                @endphp

                                @if ($item)
                                    <div style="position: relative; width: 100%; height: auto;">
                                        {{-- Imagen base --}}
                                        <img src="{{ $item['base'] }}" class="img-fluid rounded-4" style="width:100%; display:block;">
                                        
                                        {{-- Overlays --}}
                                        @if (!empty($item['overlays']))
                                            @foreach ($item['overlays'] as $overlay)
                                                <img src="{{ $overlay }}" style="position:absolute; top:0; left:0; width:100%; height:100%; pointer-events:none;">
                                            @endforeach
                                        @endif
                                    </div>
                                @else
                                    {{-- fallback --}}
                                    <img src="/img/minimalista.jpg" class="img-fluid rounded-4" alt="Casa render">
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card-body">
                                <table class="table table-borderless mb-0">
                                    <tbody>
                                        <tr>
                                            <th class="ps-0" style="width: 40%;">Folio</th>
                                            <td class="text-end pe-0">#{{ $config->id }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Fecha de Creación</th>
                                            <td class="text-end pe-0">{{ $config->created_at->format('d/m/Y h:i A') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Estilo</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['opciones-casas']['valor'] ?? '' }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Recámaras</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['Habitaciones']['valor'] ?? '' }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Precio</th>
                                            <td class="text-end pe-0">
                                                ${{ number_format($config->precio_total ?? 0, 0, '.', ',') }}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn btn-primary ver-resumen-user"
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


    <!-- MODAL RESUMEN -->
    <div class="modal fade" id="modalResumenUsuario" tabindex="-1">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Resumen de Configuración</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div id="renderPrincipalUsuario" class="mb-4"></div>

                    <h5>Miniaturas</h5>
                    <div id="miniaturasUsuario" class="d-flex gap-2 mb-4"></div>

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

                    <h4 class="mt-3">Total: 
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

            const configuration = JSON.parse(btn.dataset.configuration);
            const miniaturasData = JSON.parse(btn.dataset.miniaturas);
            const precioTotal = btn.dataset.precio;

            // ==========================
            // LIMPIAR MODAL
            // ==========================
            document.querySelector("#renderPrincipalUsuario").innerHTML = "";
            document.querySelector("#miniaturasUsuario").innerHTML = "";
            document.querySelector("#tablaResumenUsuario tbody").innerHTML = "";
            document.querySelector("#totalResumenUsuario").textContent = "$" + 
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

                document.querySelector("#renderPrincipalUsuario").appendChild(wrapper);
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

                document.querySelector("#miniaturasUsuario").appendChild(wrapper);
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
                        <td>${precio === 0
                                ? ''
                                : '$' + precio.toLocaleString("es-MX")
                            }
                        </td>
                    </tr>
                `;

                document.querySelector("#tablaResumenUsuario tbody")
                        .insertAdjacentHTML("beforeend", row);
            });

            // ==========================
            // ABRIR MODAL
            // ==========================
            const modal = new bootstrap.Modal(document.getElementById("modalResumenUsuario"));
            modal.show();

        });
    });

});
</script>

</body>
</html>
