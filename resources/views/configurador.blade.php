<!DOCTYPE html>
<html lang="es">

<x-head />
<link rel="stylesheet" href="/assets/cotizador.css">
<style>
    .thumb {
        cursor: pointer;
        border: 2px solid transparent;
        transition: border 0.3s ease;
        height: 80px;
        object-fit: cover;
    }

    .thumb-selected {
        border: 2px solid #007bff;
        /* Azul o el color que prefieras */
    }

    .preview-img.fade-out {
        opacity: 0;
        transition: opacity 0.3s ease;
    }

    .preview-img {
        transition: opacity 0.3s ease;
    }
</style>

<body class="general-background">

    <!-- Header fijo -->
    <x-header />

    <!-- Contenido principal -->
    <div class="container-fluid mt-4">
        <div class="row">

            <!-- Columna de 8 con contenido sticky -->
            <div class="col-md-8">
                <div class="sticky-content">
                    <div class="gallery-wrapper">
                        <!-- Imagen de previsualización principal -->
                        <div class="preview-image text-center mb-3">
                            <img id="mainPreview" src="/img/Tulum/Fachada A/F.jpg" alt="Vista previa" class="img-fluid preview-img">
                        </div>

                        <!-- Carrusel de miniaturas -->
                        <div id="owl-demo" class="owl-carousel gallery-carousel">
                            <div class="item"><img src="/img/Tulum/Fachada A/F.jpg" alt="imagen 1" class="thumb" /></div>
                            <div class="item"><img src="/img/1. IMG/Casas/3. Minimalista/Fachada A/B.jpg" alt="imagen 2" class="thumb" /></div>
                            <div class="item"><img src="/img/1. IMG/Casas/3. Minimalista/Fachada B/B.jpg" alt="imagen 3" class="thumb" /></div>
                            <div class="item"><img src="/img/1. IMG/Casas/4. Generales aplica en todas/Cocina/K_60x60-GrisB.jpg" alt="imagen 4" class="thumb" /></div>
                            <div class="item"><img src="/img/1. IMG/Casas/4. Generales aplica en todas/Cocina/ArenaB.jpg" alt="imagen 3" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g3.jpg" alt="imagen 5" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g4.jpg" alt="imagen 6" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g5.jpg" alt="imagen 7" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g6.jpg" alt="imagen 8" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g7.jpg" alt="imagen 9" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g2.jpg" alt="imagen 10" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g3.jpg" alt="imagen 11" class="thumb" /></div>

                        </div>
                        <div class="fade-gradient-right"></div>
                    </div>
                </div>
            </div>

            <!-- Columna de 4 con mucho contenido scrollable -->
            <div class="col-md-4 mt-100">
                <div class="long-content">
                    <h4 class="fw-bold precio-total azulFuerte"><img src="/img/tag.svg" alt="" srcset=""> $1,450,000.00 MXN</h4>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod... <a href="#">leer más</a></p>

                    <div class="accordion " id="configAccordion">

                        <!-- General -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingGeneral">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#opciones-casas" aria-expanded="true" aria-controls="opciones-casas">
                                    <span class="textAcordeon">General</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="opciones-casas" class="accordion-collapse collapse show" aria-labelledby="headingGeneral">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Estilo</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card" data-id="generalTulum">
                                                <span class="info-icon">i</span>
                                                <img src="/img/tulum.jpg" class="img-fluid rounded" alt="Tulum">
                                                <div class="option-title">Tulum</div>
                                                <div class="option-price">$120,500.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card" data-id="generalMexicano">
                                                <span class="info-icon">i</span>
                                                <img src="/img/Mexicano/Fachada A/B.jpg" class="img-fluid rounded" alt="Mexicano">
                                                <div class="option-title">Mexicano</div>
                                                <div class="option-price">$350,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card" data-id="generalMinimalista">
                                                <span class="info-icon">i</span>
                                                <img src="/img/minimalista.jpg" class="img-fluid rounded" alt="Minimalista">
                                                <div class="option-title">Minimalista</div>
                                                <div class="option-price">$220,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Fachada -->
                        <div class="accordion-item hover-shadow mb-4">
                            <div class="accordion-item hover-shadow">
                                <h2 class="accordion-header">
                                    <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#opciones-fachada">
                                        <span class="textAcordeon">Fachada</span>
                                        <span class="icon ms-auto">
                                            <!-- PLUS ICON (cuando está colapsado) -->
                                            <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                            </svg>

                                            <!-- MINUS ICON (cuando está expandido) -->
                                            <svg class="minus-icon " xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                            </svg>
                                        </span>
                                    </button>
                                </h2>
                                <div id="opciones-fachada" class="accordion-collapse collapse show">
                                    <div class="accordion-body">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <div class="option-card" data-id="optionA">
                                                    <span class="info-icon">i</span>
                                                    <img src="/img/tulum.jpg" class="img-fluid rounded" alt="Opción A">
                                                    <div class="option-title">Opción A</div>
                                                    <div class="option-price">$85,000.00</div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="option-card" data-id="optionB">
                                                    <span class="info-icon">i</span>
                                                    <img src="/img/tulum.jpg" class="img-fluid rounded" alt="Opción B">
                                                    <div class="option-title">Opción B</div>
                                                    <div class="option-price">$45,000.00</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Color -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingColor">
                                <button class="accordion-button custom-toggle"
                                    type="button"
                                    data-bs-toggle="collapse"
                                    data-bs-target="#Color"
                                    aria-expanded="true"
                                    aria-controls="Color">
                                    <span class="textAcordeon">Color</span>
                                    <span class="icon ms-auto">
                                        <!-- PLUS ICON -->
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>

                                        <!-- MINUS ICON -->
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Color" class="accordion-collapse collapse show" aria-labelledby="headingColor">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Colores disponibles</p>
                                    <div class="row g-3" id="opciones-color">
                                        <div class="col-md-6">
                                            <div class="option-card text-center estilo-color cursor-pointer" data-id="Azul Turquesa"
                                                data-valor="Azul Turquesa"
                                                data-precio="0"
                                                onclick="seleccionarColor(this)">
                                                <div class="rounded mb-2" style="height: 130px; background-color: #40E0D0;"></div>
                                                <div class="option-title">Azul Turquesa</div>
                                                <div class="option-price">$0.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card text-center estilo-color cursor-pointer" data-id="Beige"
                                                data-valor="Beige"
                                                data-precio="1000"
                                                onclick="seleccionarColor(this)">
                                                <div class="rounded mb-2" style="height: 130px; background-color: #F5F5DC;"></div>
                                                <div class="option-title">Beige</div>
                                                <div class="option-price">$1,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pisos -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingPisos">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#Pisos" aria-expanded="true" aria-controls="Pisos">
                                    <span class="textAcordeon">Pisos</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Pisos" class="accordion-collapse collapse show" aria-labelledby="headingPisos">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Estilo de Piso</p>
                                    <div class="row g-3" id="opciones-piso">
                                        <div class="col-md-6">
                                            <div class="option-card estilo-piso cursor-pointer" data-id="Mármol Santo Tomás"
                                                data-valor="Mármol Santo Tomás"
                                                data-precio="65000"
                                                onclick="seleccionarPiso(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/marmol.jpg" class="img-fluid rounded" alt="Madera">
                                                <div class="option-title">Mármol Santo Tomás</div>
                                                <div class="option-price">$65,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card estilo-piso cursor-pointer" data-id="Travertino Puebla Fiorito"
                                                data-valor="Travertino Puebla Fiorito"
                                                data-precio="48000"
                                                onclick="seleccionarPiso(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/Travertino Puebla Fiorito.jpg" class="img-fluid rounded" alt="Cerámica">
                                                <div class="option-title">Travertino Puebla Fiorito</div>
                                                <div class="option-price">$48,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Mesetas -->
                        <div class="accordion-item hover-shadow  mb-4">
                            <h2 class="accordion-header" id="headingMesetas">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#Mesetas" aria-expanded="true" aria-controls="Mesetas">
                                    <span class="textAcordeon">Mesetas</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Mesetas" class="accordion-collapse collapse show" aria-labelledby="headingMesetas">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Estilo de Meseta</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-meseta cursor-pointer" data-id="Granito Blanco Itaunas"
                                                data-nombre="Granito Blanco Itaunas"
                                                data-precio="25000"
                                                onclick="seleccionarMeseta(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/Granito Blanco Itaunas.jpg" class="img-fluid rounded" alt="Granito Blanco Itaunas">
                                                <div class="option-title">Granito Blanco Itaunas</div>
                                                <div class="option-price">$25,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-meseta cursor-pointer" data-id="Granito San Gabriel"
                                                data-nombre="Granito San Gabriel"
                                                data-precio="35000"
                                                onclick="seleccionarMeseta(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/Granito San Gabriel.jpg" class="img-fluid rounded" alt="Granito San Gabriel">
                                                <div class="option-title">Granito San Gabriel</div>
                                                <div class="option-price">$35,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Cancelería -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingCanceleria">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#Canceleria" aria-expanded="true" aria-controls="Canceleria">
                                    <span class="textAcordeon">Cancelería</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Canceleria" class="accordion-collapse collapse show" aria-labelledby="headingCanceleria">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Estilo de Cancelería</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-canceleria cursor-pointer" data-id="Negra"
                                                data-nombre="Negra"
                                                data-precio="20000"
                                                onclick="seleccionarCanceleria(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/canceleria1.png" class="img-fluid rounded" alt="Negra">
                                                <div class="option-title">Negra</div>
                                                <div class="option-price">$20,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-canceleria cursor-pointer" data-id="Plata"
                                                data-nombre="Plata"
                                                data-precio="22000"
                                                onclick="seleccionarCanceleria(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/canceleria2.png" class="img-fluid rounded" alt="Plata">
                                                <div class="option-title">Plata</div>
                                                <div class="option-price">$22,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Puertas -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingPuertas">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#Puertas" aria-expanded="true" aria-controls="Puertas">
                                    <span class="textAcordeon">Puertas</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Puertas" class="accordion-collapse collapse show" aria-labelledby="headingPuertas">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Estilo de Puertas</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-puerta cursor-pointer" data-id="Cherry Redwood"
                                                data-nombre="Cherry Redwood"
                                                data-precio="45000"
                                                onclick="seleccionarPuerta(this)">
                                                <span class="info-icon">i</span>
                                                <img src="img/puerta1.png" class="img-fluid rounded" alt="Cherry Redwood">
                                                <div class="option-title">Cherry Redwood</div>
                                                <div class="option-price">$45,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-puerta cursor-pointer" data-id="Seg Basic Chocolate"
                                                data-nombre="Seg Basic Chocolate"
                                                data-precio="45000"
                                                onclick="seleccionarPuerta(this)">
                                                <span class="info-icon">i</span>
                                                <img src="img/puerta2.png" class="img-fluid rounded" alt="Basic Chocolate">
                                                <div class="option-title">Seg Basic Chocolate</div>
                                                <div class="option-price">$45,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Addons -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingAddons">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#Addons" aria-expanded="true" aria-controls="Addons">
                                    <span class="textAcordeon">Addons</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Addons" class="accordion-collapse collapse show" aria-labelledby="headingAddons">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Opcionales</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-addon cursor-pointer" data-id="Paneles Solares"
                                                data-nombre="Paneles Solares"
                                                data-precio="85000"
                                                onclick="seleccionarAddon(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/addons1.png" class="img-fluid rounded" alt="Paneles Solares">
                                                <div class="option-title">Paneles Solares</div>
                                                <div class="option-price">$85,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-addon cursor-pointer" data-id="Aires acondicionados"
                                                data-nombre="Aires acondicionados"
                                                data-precio="18000"
                                                onclick="seleccionarAddon(this)">
                                                <span class="info-icon">i</span>
                                                <img src="/img/addons2.png" class="img-fluid rounded" alt="Aires Acondicionados">
                                                <div class="option-title">Aires acondicionados</div>
                                                <div class="option-price">$18,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Interior -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingInterior">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseInterior" aria-expanded="true" aria-controls="collapseInterior">
                                    <span class="textAcordeon">Interior</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="collapseInterior" class="accordion-collapse collapse" aria-labelledby="headingInterior">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Interior</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-interior cursor-pointer"
                                                data-nombre="Iluminación LED"
                                                data-precio="10000"
                                                onclick="seleccionarInterior(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Iluminación LED">
                                                <div class="option-title">Iluminación LED</div>
                                                <div class="option-price">$10,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-interior cursor-pointer"
                                                data-nombre="Closets"
                                                data-precio="30000"
                                                onclick="seleccionarInterior(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Closets">
                                                <div class="option-title">Closets</div>
                                                <div class="option-price">$30,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Exterior -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingExterior">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExterior" aria-expanded="true" aria-controls="collapseExterior">
                                    <span class="textAcordeon">Exterior</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="collapseExterior" class="accordion-collapse collapse" aria-labelledby="headingExterior">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Exterior</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-exterior cursor-pointer"
                                                data-nombre="Pasto Sintético"
                                                data-precio="40000"
                                                onclick="seleccionarExterior(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Pasto Sintético">
                                                <div class="option-title">Pasto Sintético</div>
                                                <div class="option-price">$40,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-exterior cursor-pointer"
                                                data-nombre="Deck Madera"
                                                data-precio="55000"
                                                onclick="seleccionarExterior(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Deck Madera">
                                                <div class="option-title">Deck Madera</div>
                                                <div class="option-price">$55,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Jardines -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingJardines">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJardines" aria-expanded="true" aria-controls="collapseJardines">
                                    <span class="textAcordeon">Jardines</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="collapseJardines" class="accordion-collapse collapse show" aria-labelledby="headingJardines">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Jardines</p>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="option-card opcion-jardines cursor-pointer"
                                                data-nombre="Jardín Zen"
                                                data-precio="60000"
                                                onclick="seleccionarJardines(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Jardín Zen">
                                                <div class="option-title">Jardín Zen</div>
                                                <div class="option-price">$60,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card opcion-jardines cursor-pointer"
                                                data-nombre="Jardín Tropical"
                                                data-precio="75000"
                                                onclick="seleccionarJardines(this)">
                                                <span class="info-icon">i</span>
                                                <img src="#" class="img-fluid rounded" alt="Jardín Tropical">
                                                <div class="option-title">Jardín Tropical</div>
                                                <div class="option-price">$75,000.00</div>
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
    </div>



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
            <a href="/resumen" class="btn btn-light ms-3">Ver Resumen ></a>
        </div>
    </div>
    <x-footer />

    <x-scripts />

</body>

</html>