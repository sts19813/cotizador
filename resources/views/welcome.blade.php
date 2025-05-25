<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Configurador de Fachada</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <link rel="stylesheet" href="style.css">
</head>

<body>

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center navbar fixed-top bg-white shadow-sm px-3 py-2 z-3">
        <button class="btn btn-outline-secondary btn-radius btn-regresar">Regresar</button>
        <img src="/img/logo.svg" alt="Logo" width="150px" class="img-fluid">
        <div>
            <button class="btn btn-outline-primary me-2 btn-radius">
                <i class="bi bi-bookmark"></i> Guardar
            </button>
            <button class="btn btn-primary btn-radius">
                Crear Cuenta <i class="bi bi-person"></i>
            </button>
        </div>
    </div>

    <div class="container-fluid py-3  mt-5 pt-4">


        <div class="row">
            <!-- Imagen principal -->
            <div class="col-md-9 scroll-column">

                <!-- Navegación Tabs -->
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a class="nav-link active" href="#">Fachada</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Pisos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Mesetas</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Addons</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Planos</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Detalles</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Garantías</a></li>
                </ul>
                <!-- Imagen principal -->
                <div class="container mb-4">
                    <div class="row">
                        <div class="col">
                            <!-- Carousel wrapper -->
                            <div id="carouselExampleIndicatorsLeft" class="carousel slide carousel-fade carousel-thumbs-top" data-bs-interval="false">

                                <!-- Slides -->
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="/img/Tulum/Fachada A/F.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                    <div class="carousel-item">
                                        <img src="/img/Tulum/Fachada A/B.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                    <div class="carousel-item">
                                        <img src="/img/3.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                    <div class="carousel-item">
                                        <img src="/img/4.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                </div>
                                <!-- Thumbnails -->
                                <div class="slider carousel-indicators position-relative">
                                    <button type="button" data-bs-target="#carouselExampleIndicatorsLeft" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1">
                                        <img class="d-block w-200"
                                            src="/img/Tulum/Fachada A/F.jpg" class="img-fluid" />
                                    </button>

                                    <button type="button" data-bs-target="#carouselExampleIndicatorsLeft" data-bs-slide-to="1" aria-label="Slide 2">
                                        <img class="d-block w-200"
                                            src="/img/Tulum/Fachada A/B.jpg" class="img-fluid" />
                                    </button>

                                    <button type="button" data-bs-target="#carouselExampleIndicatorsLeft" data-bs-slide-to="2" aria-label="Slide 3">
                                        <img class="d-block w-200"
                                            src="/img/3.jpg" class="img-fluid" />
                                    </button>
                                    <button type="button" data-bs-target="#carouselExampleIndicatorsLeft" data-bs-slide-to="3" aria-label="Slide 4">
                                        <img class="d-block w-200"
                                            src="/img/4.jpg" class="img-fluid" />
                                    </button>
                                </div>
                            </div>
                        </div>
                        <!-- Carousel wrapper -->
                    </div>
                </div>

                <div class="container mb-4">
                    <div class="row">
                        <!-- Columna izquierda: texto y listado -->
                        <div class="col-md-4 p-4" style="background-color: #f8f9fa;">
                            <p class="mb-4">
                                Descubre la esencia del hogar en nuestros espacios interiores. Desde acogedoras áreas de sala hasta dormitorios acogedores, cada habitación encarna comodidad y estilo. Explora el arte de equilibrar muebles elegantes y acentos sutiles, creando un santuario que inspira.
                            </p>
                            <table class="table table-borderless">
                                <tbody>
                                    <tr>
                                        <th scope="row">M2</th>
                                        <td>165</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Cochera</th>
                                        <td>2 autos</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Pisos</th>
                                        <td>2</td>
                                    </tr>
                                </tbody>
                            </table>
                            <ol class="ps-3">
                                <li>Estacionamiento</li>
                                <li>Cocina</li>
                                <li>Sala</li>
                                <li>Área de lavado</li>
                                <li>Baño de visitas</li>
                                <li>Recámara 1</li>
                                <li>Baño Rec. 1</li>
                                <li>Recámara 1</li>
                                <li>Recámara Principal</li>
                                <li>Closet Principal</li>
                                <li>Baño Principal</li>
                            </ol>
                        </div>

                        <!-- Columna derecha: imagen de los planos -->
                        <div class="col-md-8 p-4 text-center">
                            <img src="/img/plantas.jpg" alt="Plano de casa" class="img-fluid w-100 shadow rounded">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Panel lateral -->
            <div class="col-md-3 scroll-column">
                <h4 class="text-primary fw-bold precio-total">$1,450,000.00 MXN</h4>

                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod... <a href="#">leer más</a></p>

                <div class="accordion" id="configAccordion">

                    <!-- Sección Generada Automáticamente -->
                    <!-- Utiliza el mismo patrón para todas -->

                    <!-- General -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingGeneral">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGeneral" aria-expanded="true" aria-controls="collapseGeneral">
                                General
                            </button>
                        </h2>
                        <div id="collapseGeneral" class="accordion-collapse collapse show" aria-labelledby="headingGeneral" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <p class="fw-bold mb-1">Estilo</p>
                                <div class="row g-2" id="opciones-casas">
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-casa cursor-pointer"
                                            data-precio="120500"
                                            data-valor="Tulum"
                                            onclick="seleccionarCasa(this)">
                                            <img src="/img/tulum.jpg" class="img-fluid mb-1" alt="Tulum">
                                            <small>Tulum<br><strong>$120,500.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-casa cursor-pointer"
                                            data-precio="350000"
                                            data-valor="Mexicano"
                                            onclick="seleccionarCasa(this)">
                                            <img src="/img/Mexicano/Fachada A/B.jpg" class="img-fluid mb-1" alt="Mexicano">
                                            <small>Mexicano<br><strong>$350,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-casa cursor-pointer"
                                            data-valor="Minimalista"
                                            onclick="seleccionarCasa(this)">
                                            <img src="/img/minimalista.jpg" class="img-fluid mb-1" alt="Minimalista">
                                            <small>Minimalista<br><strong>$220,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                    <!-- Fachada -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFachada">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFachada" aria-expanded="false" aria-controls="collapseFachada">
                                Fachada
                            </button>
                        </h2>
                        <div id="collapseFachada" class="accordion-collapse collapse" aria-labelledby="headingFachada" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2" id="opciones-fachada">
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-fachada cursor-pointer"
                                            data-valor="Fachada A"
                                            data-precio="95000"
                                            onclick="seleccionarFachada(this)">
                                            <img src="/img/Tulum/Fachada A/F.jpg" class="img-fluid mb-1" alt="Fachada 1">
                                            <small>Opción A<br><strong>$95,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-fachada cursor-pointer"
                                            data-valor="Fachada B"
                                            data-precio="102000"
                                            onclick="seleccionarFachada(this)">
                                            <img src="/img/Tulum/Fachada B/B.jpg" class="img-fluid mb-1" alt="Fachada 2">
                                            <small>Opción B<br><strong>$102,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Color -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingColor">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseColor" aria-expanded="false" aria-controls="collapseColor">
                                Color
                            </button>
                        </h2>
                        <div id="collapseColor" class="accordion-collapse collapse" aria-labelledby="headingColor" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2" id="opciones-color">
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-color cursor-pointer"
                                            data-valor="Azul Turquesa"
                                            data-precio="0"
                                            onclick="seleccionarColor(this)">
                                            <div style="width: 100%; height: 60px; background-color: #40E0D0;" class="mb-2 rounded"></div>
                                            <small>Azul Turquesa<br><strong>$0.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-color cursor-pointer"
                                            data-valor="Beige"
                                            data-precio="1000"
                                            onclick="seleccionarColor(this)">
                                            <div style="width: 100%; height: 60px; background-color: #F5F5DC;" class="mb-2 rounded"></div>
                                            <small>Beige<br><strong>$1000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Pisos -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingPisos">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePisos" aria-expanded="false" aria-controls="collapsePisos">
                                Pisos
                            </button>
                        </h2>
                        <div id="collapsePisos" class="accordion-collapse collapse" aria-labelledby="headingPisos" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2" id="opciones-piso">
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-piso cursor-pointer"
                                            data-valor="Madera"
                                            data-precio="65000"
                                            onclick="seleccionarPiso(this)">
                                            <img src="/img/marmol.jpg" class="img-fluid mb-1" alt="Madera">
                                            <small>Marmol Santo Tomás<br><strong>$65,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border rounded text-center estilo-piso cursor-pointer"
                                            data-valor="Cerámica"
                                            data-precio="48000"
                                            onclick="seleccionarPiso(this)">
                                            <img src="/img/Travertino Puebla Fiorito.jpg" class="img-fluid mb-1" alt="Cerámica">
                                            <small>Travertino Puebla Fiorito<br><strong>$48,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Mesetas -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingMesetas">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMesetas" aria-expanded="false" aria-controls="collapseMesetas">
                                Mesetas
                            </button>
                        </h2>
                        <div id="collapseMesetas" class="accordion-collapse collapse" aria-labelledby="headingMesetas" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="opcion-meseta border rounded text-center" data-precio="25000" data-nombre="Granito Blanco Itaunas">
                                            <img src="/img/Granito Blanco Itaunas.jpg" class="img-fluid mb-1" alt="Granito">
                                            <small>Granito Blanco Itaunas<br><strong>$25,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="opcion-meseta border rounded text-center" data-precio="35000" data-nombre="Granito San Gabriel">
                                            <img src="/img/Granito San Gabriel.jpg" class="img-fluid mb-1" alt="Mármol">
                                            <small>Granito San Gabriel<br><strong>$35,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cancelería -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingCanceleria">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseCanceleria" aria-expanded="false" aria-controls="collapseCanceleria">
                                Cancelería
                            </button>
                        </h2>
                        <div id="collapseCanceleria" class="accordion-collapse collapse" aria-labelledby="headingCanceleria" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="/img/canceleria1.png" class="img-fluid mb-1" alt="Negra">
                                            <small>Negra<br><strong>$20,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="/img/canceleria2.png" class="img-fluid mb-1" alt="Plata">
                                            <small>Plata<br><strong>$22,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Puertas -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingPuertas">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapsePuertas" aria-expanded="false" aria-controls="collapsePuertas">
                                Puertas
                            </button>
                        </h2>
                        <div id="collapsePuertas" class="accordion-collapse collapse" aria-labelledby="headingPuertas" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="img/puerta1.png" class="img-fluid mb-1" alt="Cherry Redwood">
                                            <small>Cherry Redwood<br><strong>$45,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="img/puerta2.png" class="img-fluid mb-1" alt="Basic Chocolate">
                                            <small>Seg Basic Chocolate<br><strong>$45,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Addons -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingAddons">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseAddons" aria-expanded="false" aria-controls="collapseAddons">
                                Addons
                            </button>
                        </h2>
                        <div id="collapseAddons" class="accordion-collapse collapse" aria-labelledby="headingAddons" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="/img/addons1.png" class="img-fluid mb-1" alt="Paneles Solares">
                                            <small>Paneles Solares<br><strong>$85,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="/img/addons2.png" class="img-fluid mb-1" alt="Aires Acondicionados">
                                            <small>Aires acondicionados<br><strong>$18,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Interior -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingInterior">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInterior" aria-expanded="false" aria-controls="collapseInterior">
                                Interior
                            </button>
                        </h2>
                        <div id="collapseInterior" class="accordion-collapse collapse" aria-labelledby="headingInterior" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/ccccff" class="img-fluid mb-1" alt="Iluminación LED">
                                            <small>Iluminación LED<br><strong>$10,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/ffe4b5" class="img-fluid mb-1" alt="Closets">
                                            <small>Closets<br><strong>$30,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Exterior -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingExterior">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExterior" aria-expanded="false" aria-controls="collapseExterior">
                                Exterior
                            </button>
                        </h2>
                        <div id="collapseExterior" class="accordion-collapse collapse" aria-labelledby="headingExterior" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/228B22" class="img-fluid mb-1" alt="Pasto Sintético">
                                            <small>Pasto Sintético<br><strong>$40,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/b0c4de" class="img-fluid mb-1" alt="Deck">
                                            <small>Deck Madera<br><strong>$55,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Jardines -->
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingJardines">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJardines" aria-expanded="false" aria-controls="collapseJardines">
                                Jardines
                            </button>
                        </h2>
                        <div id="collapseJardines" class="accordion-collapse collapse" aria-labelledby="headingJardines" data-bs-parent="#configAccordion">
                            <div class="accordion-body">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/8fbc8f" class="img-fluid mb-1" alt="Jardín Zen">
                                            <small>Jardín Zen<br><strong>$60,000.00</strong></small>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="border p-2 rounded text-center">
                                            <img src="https://via.placeholder.com/100x70/9acd32" class="img-fluid mb-1" alt="Jardín Tropical">
                                            <small>Jardín Tropical<br><strong>$75,000.00</strong></small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- Bottom bar -->
    <div class="bottom-bar d-flex justify-content-between align-items-center">
        <div class="d-flex gap-3">
            <button class="btn text-light p-10">
                <i class="bi bi-bookmark me-1"></i> Guardar
            </button>
            <button class="btn text-light p-10">
                <i class="bi bi-arrow-counterclockwise me-1"></i> Volver a empezar
            </button>
            <button class="btn text-light p-10">
                <i class="bi bi-chat-dots me-1"></i> Solicitar Asesoría
            </button>
            <button class="btn text-light p-10">
                <i class="bi bi-download me-1"></i> Descargar
            </button>
        </div>

        <div>
            <strong class="precio-total">$1,450,000.00 MXN</strong>
            <a href="#" class="btn btn-light ms-3">Ver Resumen ></a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="script.js"></script>
</body>

</html>