<style>
    .legend-item {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-weight: 500;
    }

    /* Puntito base */
    .legend-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        display: inline-block;
        flex-shrink: 0;
    }

    /* Colores por estado */
    .legend-item.sold .legend-dot {
        background-color: #dc3545;
        /* rojo */
    }

    .legend-item.available .legend-dot {
        background-color: #198754;
        /* verde */
    }

    .legend-item.reserved .legend-dot {
        background-color: #ffc107;
        /* amarillo */
    }
</style>

<div class="modal fade" id="modalPiaro" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content border-0 rounded-4 shadow-lg">

            <!-- HEADER -->
            <div class="modal-header border-0 position-relative">
                <div class="w-100 text-center">
                    <img src="/assets/img/piaro.svg" alt="PIARÓ" style="width:210px">

                    <p class="text-primary fw-semibold mt-3 mb-1">
                        Selecciona un lote para agregar al proyecto de tu casa
                    </p>

                    <div class="d-flex justify-content-center gap-4 small mt-2">
                        <span class="legend-item sold">
                            <span class="legend-dot"></span> Vendidos
                        </span>
                        <span class="legend-item available">
                            <span class="legend-dot"></span> Disponibles
                        </span>
                        <span class="legend-item reserved">
                            <span class="legend-dot"></span> Apartados
                        </span>
                    </div>

                </div>

                <button type="button" class="btn-close position-absolute top-0 end-0 m-3" data-bs-dismiss="modal">
                </button>
            </div>

            <!-- BODY -->
            <div class="modal-body pt-0">
                <div class="piaro-map-wrapper">
                    <div class="map-container" style="position:relative; display:inline-block;">

                        <img src="/img/piaro/1756357825_piaro-masterplan.jpg" class="map-base" alt="Masterplan Piaro"
                            style="width:100%; height:auto;">

                        <div class="svg-layer" id="piaroLotsLayer"
                            style="position:absolute; top:0; left:0; width:100%;">
                            {!! file_get_contents(
    public_path('/img/piaro/1756357825_piaro-masterplan-01.svg')
) !!}
                        </div>

                    </div>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="modal-footer border-0 justify-content-center small">
                ¿Quieres conocer más acerca de Piaró Tropical Living?
                <a href="https://piaro.mx" target="_blank" class="text-primary fw-semibold ms-1">
                    visita su sitio web
                </a>
            </div>

        </div>
    </div>
</div>