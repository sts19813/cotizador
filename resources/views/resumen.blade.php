<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

    <x-header />

    <div class="general-background">
        <div class="seccion-casa">
            <div class="subtitulo">La casa de tus sueños hecha realidad</div>
            <div class="texto-fondo">1 Recámara</div>
            <img src="/img/resumen.png" alt="Casa 1 recámara" class="imagen-casa animar-subida">
        </div>
    </div>


    <div class="container mt-4 white-background">

        <h2 class="text-center fw-bold">Resumen</h2>
        <p class="text-center text-muted">#01201931059</p>


        <hr>
        <div id="selecciones"></div>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12 text-center">

                <div class="title-sub">¡Listo! Tu casa personalizada está configurada</div>

                <p class="text col-md-10 mx-auto">
                    Ahora que has creado la casa de tus sueños, podrás verla siempre que quieras desde tu perfil.
                    Nosotros prepararemos una cotización a la medida y te contactaremos con la mejor propuesta
                    para hacerla realidad.
                </p>

                <div class="mb-3">
                    <button class="btn btn-primary me-2">Solicitar Casa</button>
                    <button class="btn btn-outline-primary me-2" onclick="saveConfiguration()">Guardar</button>
                    <button class="btn btn-outline-primary">Solicitar Asesor</button>
                </div>

            </div>


        </div>
        <br>
        <hr>
        <br>
        <div class="row">
            <div class="col-md-12">
                <div class="custom-layout">
                    <div class="info-column col-12 info-box">

                        <div class="info-row"><span class="label">Estilo:</span> <span id="estilotabla">Tulum</span>
                        </div>
                        <div class="info-row"><span class="label">Recámaras:</span> <span id="recamarastabla">2</span>
                        </div>
                        <div class="info-row"><span class="label">Fachada:</span> <span id="fachadatabla">A</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <h2 style="text-align: center;">Galería</h2>
        <hr>
        <div class="gallery-wrapper row">
            <img id="imagenGuardada" alt="Captura de sección">

        </div>

        <br><br>
        <h2 style="text-align:center;">Exterior</h2>
        <table id="tablaResumen" class="table options-table">
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
    </div>

    <br><br>
    <x-footer />

    <x-scripts />

    <script>
        $('.gallery-carousel').owlCarousel({
            loop: false,
            margin: 10,
            nav: true,
            dots: false,
            navText: [
                '<i class="bi bi-chevron-left fs-4"></i>', // izquierda
                '<i class="bi bi-chevron-right fs-4"></i>' // derecha
            ],
            responsive: {
                0: {
                    items: 2
                },
                600: {
                    items: 4
                },
                1000: {
                    items: 6
                }
            }
        });
        /*
                document.addEventListener('DOMContentLoaded', function() {
                    // Recupera y parsea la información desde localStorage
                    let selections = JSON.parse(localStorage.getItem('selections')) || {};

                    // Mostrar en pantalla
                    const contenedor = document.getElementById('selecciones');
                    contenedor.innerText = JSON.stringify(selections, null, 2); // formateado
                });*/
    </script>

    <script>
        const savedSelections = JSON.parse(localStorage.getItem('selections')) || {};

        const tbody = document.querySelector('#tablaResumen tbody');
        tbody.innerHTML = '';

        Object.values(savedSelections).forEach(item => {
            const row = `
        <tr>
            <td>${item.categoria ?? ''}</td>
            <td>${item.valor ?? ''}</td>
            <td>${item.id ?? ''}</td>
            <td class="text-nowrap">
                $${(item.precio ?? 0).toLocaleString('es-MX', {minimumFractionDigits: 2})}
                <a href="#" class="ms-2 d-inline-flex align-items-center text-decoration-none text-dark">
                    <i class="bi bi-pencil me-1"></i> Cambiar
                </a>
            </td>
        </tr>
    `;
            tbody.insertAdjacentHTML('beforeend', row);
        });



        document.addEventListener('DOMContentLoaded', () => {
            const dataURL = localStorage.getItem('imagenResumen');
            if (dataURL) {
                document.querySelector('#imagenGuardada').src = dataURL;
            }
        });

        document.querySelector('.texto-fondo').textContent = savedSelections.Habitaciones.valor;
        document.querySelector('#recamarastabla').textContent = savedSelections.Habitaciones.valor;
        document.querySelector('#fachadatabla').textContent = savedSelections["collapse-21"].valor;
        document.querySelector('#estilotabla').textContent = savedSelections["opciones-casas"].valor;


        async function saveConfiguration() {
            try {
                const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

                // Calcula el precio total sumando los precios de cada selección
                const totalPrice = Object.values(selections).reduce((sum, sel) => {
                    return sel && sel.precio ? sum + sel.precio : sum;
                }, 0);

                const dataToSave = {
                    configuration: savedSelections,
                    precioTotal: totalPrice,
                    fecha: new Date().toISOString(),
                };

                const response = await fetch('/house-configurations', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': token,
                        'Accept': 'application/json'
                    },
                    credentials: 'include',
                    body: JSON.stringify(dataToSave)
                });

                if (!response.ok) {
                    const errorData = await response.json();
                    throw new Error(errorData.message || 'Error desconocido al guardar');
                }

                const responseData = await response.json();
                alert("Guardado con éxito: " + (responseData.message || ''));

            } catch (error) {
                debugger
                alert("Error al guardar: " + error.message);
            }
        }
    </script>



</body>

</html>
