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
        <p class="text-center text-muted">#000</p>


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
                    @auth
                        <button class="btn btn-primary me-2" onclick="saveConfiguration()">Guardar</button>
                        <a href="/" class="btn btn-outline-primary">Crear otra</a>
                    @else
                        <a href="/registro" class="btn btn-primary me-2">Iniciar sesión para guardar</a>
                    @endauth

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

                        <div class="info-row"><span class="label">Estilo:</span> <span id="estilotabla"></span>
                        </div>
                        <div class="info-row"><span class="label">Recámaras:</span> <span id="recamarastabla">2</span>
                        </div>
                        <div class="info-row"><span class="label">Fachada:</span> <span id="fachadatabla">A</span>
                        </div>

                    </div>



                </div>

            </div>

            <div class="container" style="text-align: center; margin-top: 20px;">
                <br><br>
                <img src="/img/1.png" alt="" srcset="" width="500px">
            </div>
        </div>
        <br><br>
        <h2 style="text-align: center;">Galería</h2>
        <hr>
        <div class="gallery-wrapper row">
            <img id="imagenGuardada" alt="Captura de sección" src="" style="text-align: center">

        </div>

        <br><br>
        <h2 style="text-align:center;">Configuración</h2>
        <table id="tablaResumen" class="table options-table">
            <thead>
                <tr>
                    <th>Categoría</th>
                    <th>Opción</th>
                    <th>Código</th>
                    <th>Imagen</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <br><br>
    <x-footer />

    <x-scripts />



    <script>
        const savedSelections = JSON.parse(localStorage.getItem('selections')) || {};
        const imagenes = JSON.parse(localStorage.getItem('imagenesCarrusel'));

         const secciones = [
    { id: '#opciones-fachada', carouselIndex: 0 },
    { id: '#heading-22', carouselIndex: 4 },
    { id: '#heading-27', carouselIndex: 4 },
    { id: '#heading-28', carouselIndex: 4 },
    { id: '#heading-32', carouselIndex: 4 },
    { id: '#heading-24', carouselIndex: 5 },
    { id: '#heading-33', carouselIndex: 6 },
    { id: '#heading-38', carouselIndex: 6 },
    { id: '#heading-35', carouselIndex: 6 },
    { id: '#heading-39', carouselIndex: 6 },
    { id: '#heading-23', carouselIndex: 7 },
    { id: '#heading-25', carouselIndex: 7 },
    { id: '#heading-26', carouselIndex: 7 },
    { id: '#heading-36', carouselIndex: 7 },
  ];

        document.addEventListener('DOMContentLoaded', () => {
            const dataURL = localStorage.getItem('imagenResumen');
            if (dataURL) {
                document.querySelector('#imagenGuardada').src = dataURL;
            }
        });

        const tbody = document.querySelector('#tablaResumen tbody');
        imagenGuardada
        tbody.innerHTML = '';

        Object.values(savedSelections).forEach((item, index) => {
            const imagenSrc = imagenes[index] ?? item.imagen ?? ''; // prioridad: array -> item.imagen -> vacío
            const row = `
        <tr>
            <td>${item.categoria ?? ''}</td>
            <td>${item.valor ?? ''}</td>
            <td>
                ${item.pre_code ? 'Pre: ' + item.pre_code + '<br>' : ''}
                ${item.variant_code ? 'Var: ' + item.variant_code : ''}
            </td>
            <td class="text-nowrap">
                ${imagenSrc ? `<img src="${imagenSrc}" alt="" width="100px" class="img-fluid rounded">` : ''}
            </td>
        </tr>
    `;
            tbody.insertAdjacentHTML('beforeend', row);
        });





        document.querySelector('.texto-fondo').textContent = savedSelections.Habitaciones.valor;
        document.querySelector('#recamarastabla').textContent = savedSelections.Habitaciones.valor;
        document.querySelector('#fachadatabla').textContent = savedSelections["collapse-21"].valor;
        document.querySelector('#estilotabla').textContent = savedSelections["Estilos"].valor;



        if (savedSelections["collapse-21"]?.valor === "Fachada B") {
            document.querySelector('.imagen-casa').src = "/img/resumen-b.png";
        } else {
            document.querySelector('.imagen-casa').src = "/img/resumen.png";
        }


        const recamaras = savedSelections.Habitaciones.valor;
        let imgSrc = "/img/1.png";
        if (recamaras === "2 Recámaras") imgSrc = "/img/2.png";
        else if (recamaras === "3 Recámaras") imgSrc = "/img/3.png";
        else if (recamaras === "4 Recámaras") imgSrc = "/img/4.png";
        document.querySelector('img[alt=""][src^="/img/"][width="500px"]').src = imgSrc;

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
