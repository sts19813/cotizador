<style>
    /* Modal asesor */
    .asesor-modal {
        border-radius: 20px;
        margin: auto;
    }

    /* Inputs redondeados */
    .form-rounded {
        border-radius: 14px;
        padding: 12px 14px;
        font-size: 0.9rem;
    }

    /* Botón principal */
    .btn-primary {
        background-color: #3F6DF6;
        border-color: #3F6DF6;
    }

    /* Texto */
    .modal-body h5 {
        line-height: 1.4;
    }
</style>

<div class="modal fade" id="modalAsesor" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" style="min-width: 800px">
        <div class="modal-content asesor-modal border-0">

            <div class="modal-body p-4 p-md-5">

                <!-- LOGO -->
                <div class="text-center mb-4">
                    <img src="/img/logo.svg" alt="UONDR" style="height:42px;">
                </div>

                <!-- TITULO -->
                <h5 class="fw-bold text-center mb-2">
                    Asesoría personalizada para tu proyecto en UONDR
                </h5>

                <p class="text-center small mb-4">
                    Estamos listos para ayudarte a llevar tu proyecto al siguiente nivel.
                    Al enviar tus datos, un asesor revisará la casa y el lote que configuraste
                    para orientarte sobre precios, financiamiento y disponibilidad.
                </p>

                <!-- FORM -->
                <form id="formAsesor">

                    <div class="row g-3 mb-3">
                        <div class="col-6">
                            <label class="form-label small">Nombre*</label>
                            <input type="text" class="form-control form-rounded" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label small">Apellido*</label>
                            <input type="text" class="form-control form-rounded" required>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-6">
                            <label class="form-label small">Correo*</label>
                            <input type="email" class="form-control form-rounded" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label small">Celular*</label>
                            <input type="tel" class="form-control form-rounded" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label small">Mensaje</label>
                        <textarea class="form-control form-rounded" rows="3"></textarea>
                    </div>

                    <!-- BOTON PRINCIPAL -->
                    <button type="submit" class="btn btn-primary w-100 rounded-pill mb-3">
                        Confirmar y enviar
                    </button>

                    <!-- BOTON REGRESAR -->
                    <button type="button" class="btn btn-outline-dark w-100 rounded-pill" data-bs-dismiss="modal">
                        Regresar
                    </button>

                </form>

                <!-- TEXTO LEGAL -->
                <p class=" text-center small mt-4 mb-0">
                    Al enviar este formulario aceptas nuestras
                    <a href="#" class="text-decoration-none">Políticas de Privacidad</a> y
                    <a href="#" class="text-decoration-none">Términos y Condiciones</a>.
                    Tus datos serán utilizados exclusivamente para fines relacionados con UONDR.
                </p>

            </div>
        </div>
    </div>
</div>