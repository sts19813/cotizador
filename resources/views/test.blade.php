<!DOCTYPE html>
<html lang="es">

<x-head />
<link rel="stylesheet" href="/assets/cotizador.css">
<style>
    .thumb {
        cursor: pointer;
        border: 2px solid transparent;
        transition: border 0.01s ease;
        height: 80px;
        object-fit: cover;
    }

    .thumb-selected {
        border: 2px solid #007bff;
        /* Azul o el color que prefieras */
    }

    .preview-img.fade-out {
        opacity: 0;
        transition: opacity 0.01s ease;
    }

    .preview-img {
        transition: opacity 0.01s ease;
    }

    .bg-habitaciones {
        background-color: #4C7DFA;
    }

    .bg-habitaciones span {
        color: white;
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
                        <div class="preview-image text-center">
                            <img id="mainPreview" src="/img/Tulum/Fachada A/F.jpg" alt="Vista previa"
                                class="img-fluid preview-img">
                        </div>

                        <!-- Carrusel de miniaturas -->
                        <div id="owl-demo" class="owl-carousel gallery-carousel">
                            <div class="item"><img src="/img/Tulum/Fachada A/F.jpg" alt="imagen 1" class="thumb" />
                            </div>
                            <div class="item"><img src="/img/1. IMG/Casas/3. Minimalista/Fachada A/B.jpg"
                                    alt="imagen 2" class="thumb" /></div>
                            <div class="item"><img src="/img/1. IMG/Casas/3. Minimalista/Fachada B/B.jpg"
                                    alt="imagen 3" class="thumb" /></div>
                            <div class="item"><img
                                    src="/img/1. IMG/Casas/4. Generales aplica en todas/Cocina/K_60x60-GrisB.jpg"
                                    alt="imagen 4" class="thumb" /></div>
                            <div class="item"><img
                                    src="/img/1. IMG/Casas/4. Generales aplica en todas/Cocina/ArenaB.jpg"
                                    alt="imagen 3" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g4.jpg" alt="imagen 6" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g6.jpg" alt="imagen 8" class="thumb" /></div>
                            <div class="item"><img src="/img/resumen/g7.jpg" alt="imagen 9" class="thumb" /></div>
                            <div class="item"><img
                                    src="/img/1. IMG/Casas/4. Generales aplica en todas/Baños/B_60X60-ArenaB.jpg"
                                    alt="imagen 3" class="thumb" /></div>
                            <div class="item"><img
                                    src="/img/1. IMG/Casas/4. Generales aplica en todas/Baños/B_60x60-ArenaN.jpg"
                                    alt="imagen 3" class="thumb" /></div>
                        </div>
                        <div class="fade-gradient-right"></div>
                    </div>
                </div>
            </div>
            <!-- Columna de 4 con mucho contenido scrollable -->
            <div class="col-md-4 mt-100">
                <div class="long-content">
                    <h4 class="fw-bold precio-total azulFuerte"><img src="/img/tag.svg" alt="" srcset="">
                        $1,450,000.00 MXN</h4>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit
                        amet, consectetur adipiscing elit, sed do eiusmod Lorem ipsum dolor sit amet, consectetur
                        adipiscing elit, sed do eiusmod... <a href="#">leer más</a></p>

                    <div class="accordion " id="configAccordion">

                        <!-- General -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingGeneral">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#opciones-casas" aria-expanded="true"
                                    aria-controls="opciones-casas">
                                    <span class="textAcordeon">General</span>
                                    <span class="icon ms-auto">
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                            height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path
                                                d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                            height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="opciones-casas" class="accordion-collapse collapse show"
                                aria-labelledby="headingGeneral">
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
                                                <img src="/img/Mexicano/Fachada A/B.jpg" class="img-fluid rounded"
                                                    alt="Mexicano">
                                                <div class="option-title">Mexicano</div>
                                                <div class="option-price">$350,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card" data-id="generalMinimalista">
                                                <span class="info-icon">i</span>
                                                <img src="/img/minimalista.jpg" class="img-fluid rounded"
                                                    alt="Minimalista">
                                                <div class="option-title">Minimalista</div>
                                                <div class="option-price">$220,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Número de habitaciones -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingHabitaciones">
                                <button class="accordion-button custom-toggle" type="button"
                                    data-bs-toggle="collapse" data-bs-target="#Habitaciones" aria-expanded="true"
                                    aria-controls="Habitaciones">
                                    <span class="textAcordeon">Número de habitaciones</span>
                                    <span class="icon ms-auto">
                                        <!-- PLUS ICON -->
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                            height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path
                                                d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                        </svg>
                                        <!-- MINUS ICON -->
                                        <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                            height="20" fill="currentColor" viewBox="0 0 16 16">
                                            <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                        </svg>
                                    </span>
                                </button>
                            </h2>
                            <div id="Habitaciones" class="accordion-collapse collapse show"
                                aria-labelledby="headingHabitaciones">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Elige el número de habitaciones</p>
                                    <div class="row g-3" id="opciones-habitaciones">
                                        <div class="col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="1Habitacion"
                                                data-valor="1 habitación" data-precio="0"
                                                onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">01</span>
                                                </div>
                                                <div class="option-title">1 Habitación</div>
                                                <div class="option-price">$0.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="2Habitaciones" data-valor="2 habitaciones"
                                                data-precio="25000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">02</span>
                                                </div>
                                                <div class="option-title">2 Habitaciones</div>
                                                <div class="option-price">$25,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="3Habitaciones" data-valor="3 habitaciones"
                                                data-precio="40000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">03</span>
                                                </div>
                                                <div class="option-title">3 Habitaciones</div>
                                                <div class="option-price">$40,000.00</div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="4Habitaciones" data-valor="4 habitaciones"
                                                data-precio="60000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">04</span>
                                                </div>
                                                <div class="option-title">4 Habitaciones</div>
                                                <div class="option-price">$60,000.00</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        @foreach ($categories as $category)
                            <div class="accordion-item hover-shadow mb-4">
                                <h2 class="accordion-header" id="heading-{{ $category->id }}">
                                    <button class="accordion-button custom-toggle" type="button"
                                        data-bs-toggle="collapse" data-bs-target="#collapse-{{ $category->id }}"
                                        aria-expanded="false" aria-controls="collapse-{{ $category->id }}">
                                        <span class="textAcordeon">{{ $category->name }}</span>
                                        <span class="icon ms-auto">
                                            <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                                height="20" fill="currentColor" viewBox="0 0 16 16">
                                                <path
                                                    d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                            </svg>
                                            <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                                height="20" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                            </svg>
                                        </span>
                                    </button>
                                </h2>

                                <div id="collapse-{{ $category->id }}" class="accordion-collapse collapse"
                                    aria-labelledby="heading-{{ $category->id }}">
                                    <div class="accordion-body">
                                        <p class="fw-bold mb-1">Opciones de {{ $category->name }}</p>
                                        <div class="row g-3" id="opciones-{{ Str::slug($category->name) }}">
                                            @foreach ($category->products as $product)
                                                <div class="col-md-6">
                                                    <div class="option-card estilo-{{ Str::slug($category->name) }} cursor-pointer"
                                                        data-id="{{ $product->id }}"
                                                        data-valor="{{ $product->description }}"
                                                        data-precio="{{ $product->base_price }}"
                                                        data-categoria="{{ Str::slug($category->name) }}"
                                                        onclick="seleccionarOpcion(this)">
                                                        <span class="info-icon">i</span>
                                                        <img src="{{ $product->image_url ?? 'https://via.placeholder.com/400x300' }}"
                                                            class="img-fluid rounded"
                                                            alt="{{ $product->description }}" width="350px">
                                                        <div class="option-title">{{ $product->description }}</div>
                                                        <div class="option-price">
                                                            ${{ number_format($product->base_price, 2) }}</div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
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
