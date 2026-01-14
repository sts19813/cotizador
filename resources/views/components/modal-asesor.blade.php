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
                            <input type="text" name="nombre" class="form-control form-rounded" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label small">Apellido*</label>
                            <input type="text" name="apellido" class="form-control form-rounded" required>
                        </div>
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-6">
                            <label class="form-label small">Correo*</label>
                            <input type="email" name="email" class="form-control form-rounded" required>
                        </div>

                        <div class="col-6">
                            <label class="form-label small">Celular*</label>
                            <input type="tel" name="telefono" class="form-control form-rounded" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label small">Mensaje</label>
                        <textarea name="mensaje" class="form-control form-rounded" rows="3"></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 rounded-pill mb-3">
                        Confirmar y enviar
                    </button>

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


<script>
    document.getElementById('formAsesor')?.addEventListener('submit', async (e) => {
        e.preventDefault();

        try {
            const token = document.querySelector('meta[name="csrf-token"]')?.content;

            const form = e.target;

            const payload = {
                lead: {
                    nombre: form.querySelector('[name="nombre"]').value,
                    apellido: form.querySelector('[name="apellido"]').value,
                    email: form.querySelector('[name="email"]').value,
                    telefono: form.querySelector('[name="telefono"]').value,
                    mensaje: form.querySelector('textarea')?.value || '',
                },
                context: window.leadContext
            };

            const res = await fetch('/leads', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    ...(token ? { 'X-CSRF-TOKEN': token } : {}),
                },
                body: JSON.stringify(payload)
            });

            if (!res.ok) throw new Error('Error al enviar');

            Swal.fire({
                icon: 'success',
                title: 'Enviado',
                text: 'Un asesor se pondrá en contacto contigo.',
                timer: 3000,
                showConfirmButton: false
            });

            bootstrap.Modal.getInstance(
                document.getElementById('modalAsesor')
            )?.hide();

        } catch (err) {
            Swal.fire('Error', err.message, 'error');
        }
    });

</script>