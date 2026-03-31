<style>
    .legend-item {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        font-weight: 500;
    }

    .legend-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        display: inline-block;
        flex-shrink: 0;
    }

    .legend-item.sold .legend-dot { background-color: #dc3545; }
    .legend-item.available .legend-dot { background-color: #198754; }
    .legend-item.reserved .legend-dot { background-color: #ffc107; }

    .development-card {
        background: #fff;
        border-radius: 14px;
        border: 1px solid #e8ebf0;
        overflow: hidden;
    }

    .development-main-btn {
        width: 100%;
        display: flex;
        align-items: center;
        justify-content: space-between;
        text-align: left;
        border: 0;
        border-radius: 0;
        padding: 12px 16px;
        font-weight: 700;
        color: #20242c;
        background: transparent;
    }

    .development-main-btn.active {
        background: #f2f6ff;
        color: #1f4ca0;
    }

    .development-main-content {
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .development-icon {
        font-size: 26px;
        line-height: 1;
        font-weight: 300;
        color: #20242c;
    }

    .development-children {
        padding: 0 16px 12px;
    }

    .development-children-buttons {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
    }

</style>

<div class="modal fade" id="modalPiaro" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content border-0 rounded-4 shadow-lg">
            <div class="modal-header border-0 position-relative">
                <div class="w-100 text-center">
                    <h4 class="fw-bold mb-1" id="developmentModalTitle">Piaró</h4>
                    <p class="text-primary fw-semibold mt-3 mb-1">Selecciona un lote para agregar al proyecto de tu casa</p>

                    <div id="developmentSelector" class="d-flex flex-column align-items-stretch mb-3 w-100"></div>

                    <div class="d-flex justify-content-center gap-4 small mt-2">
                        <span class="legend-item sold"><span class="legend-dot"></span> Vendidos</span>
                        <span class="legend-item available"><span class="legend-dot"></span> Disponibles</span>
                        <span class="legend-item reserved"><span class="legend-dot"></span> Apartados</span>
                    </div>
                </div>

                <button type="button" class="btn-close position-absolute top-0 end-0 m-3" data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body pt-0">
                <div class="piaro-map-wrapper">
                    <div class="map-container" style="position:relative; display:inline-block; width:100%;">
                        <img id="dynamicMapBase" src="" class="map-base" alt="Masterplan" style="width:100%; height:auto;">
                        <div class="svg-layer" id="dynamicSvgLayer" style="position:absolute; top:0; left:0; width:100%;"></div>
                    </div>
                </div>
            </div>

            <div class="modal-footer border-0 justify-content-center small">
                Selecciona el desarrollo y el lote para continuar con tu configuración.
            </div>
        </div>
    </div>
</div>
