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

    .thumb-wrapper.thumb-selected {
        border: 2px solid #007bff;
        border-radius: 10px;
        overflow: hidden;
        position: relative;
        box-sizing: border-box;
    }

    .preview-img.fade-out {
        opacity: 0;
        transition: opacity 0.01s ease;
    }


    .bg-habitaciones {
        background-color: #4C7DFA;
    }

    .bg-habitaciones span {
        color: white;
    }

    .preview-image {
        max-width: 1600px;
        margin: 0 auto;
        position: relative;
    }

    .preview-image img {
        max-width: 100%;
        height: auto;
    }

    .image-loader {
        position: absolute;
        inset: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.55);
        backdrop-filter: blur(2px);
        z-index: 10;
    }

    .preview-img.fade-out {
        opacity: 0;
        transition: opacity 0.18s ease;
    }


    @media only screen and (max-width: 600px) {
        #mainPreview {
            margin-top: 70px;
        }

        .sticky-content {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 9;
            padding: 10px;
            background: white
        }


        .btn-radius {
            display: none
        }
    }

    .accordion-button .minus-icon {
        display: none;
    }

    .accordion-button:not(.collapsed) .plus-icon {
        display: none;
    }

    .accordion-button:not(.collapsed) .minus-icon {
        display: inline-block;
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
                        <div class="preview-image text-center" style="position: relative;">
                            <img id="mainPreview" src="/img/Tulum/Fachada A/F.jpg" alt="Vista previa"
                                class="img-fluid preview-img">
                            <div id="imageLoader" class="image-loader" style="display:none;">
                                <div class="spinner-border text-primary" role="status" style="width:3rem;height:3rem;">
                                    <span class="visually-hidden">Cargando...</span>
                                </div>
                            </div>
                        </div>

                        <!-- Carrusel de miniaturas -->
                        <div id="owl-demo" class="owl-carousel gallery-carousel">
                            <div class="item">
                                <img src="/baseMinimalista/fachadaA/01-F.jpg" alt="imagen 1" class="thumb" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/fachadaA/02-R.jpg" alt="imagen 2" class="thumb" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/fachadaA/03L.jpg" alt="imagen 3" class="thumb" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/fachadaA/04-B.jpg" alt="imagen 4" class="thumb" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/MINIMALISTA-SALA-BASE.jpg" alt="imagen 5" class="thumb"
                                    data-overlay="/baseMinimalista/PISOS/Cocina/COCINA-M01.png" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/MINIMALISTA-COCINA-BASE.jpg" alt="imagen 6" class="thumb"
                                    data-overlay="/baseMinimalista/PISOS/Recamara/CUARTO-M01.png" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>

                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/MINIMALISTA-RECAMARA-BASE.jpg" alt="imagen 7" class="thumb"
                                    data-overlay="/baseMinimalista/PISOS/Sala/SALA-M01.png" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>
                            </div>
                            <div class="item">
                                <img src="/baseMinimalista/MINIMALISTA-Bano-BASE.jpg" alt="imagen 8" class="thumb"
                                    data-overlay="/baseMinimalista/PISOS/Sala/SALA-M01.png" />
                                <div class="overlay-container"
                                    style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!-- Columna de 4 con mucho contenido scrollable -->
            <div class="col-md-4 mt-100">
                <div class="long-content">

                    <p>Bienvenido al configurador de casas UONDR. Explora y personaliza tu casa ideal eligiendo el
                        estilo, número de habitaciones y más. Cuando termines, guarda tu configuración y nos pondremos
                        en contacto contigo para enviarte una propuesta personalizada.</p>


                    <div class="accordion " id="configAccordion">

                        <!-- General -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingGeneral">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#opciones-casas" aria-expanded="true"
                                    aria-controls="opciones-casas">
                                    <span class="textAcordeon">Estilo</span>
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
                                    <div class="row g-3">
                                        <div class="col-6 col-md-6">
                                            <div class="option-card" data-id="generalMinimalista">
                                                <img src="/img/minimalista.jpg" class="img-fluid rounded"
                                                    alt="Minimalista">
                                                <div class="option-title">Minimalista</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card" data-id="generalTulum">
                                                <img src="/img/tulum.jpg" class="img-fluid rounded" alt="Tulum">
                                                <div class="option-title">Tulum</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card" data-id="generalMexicano">
                                                <img src="/img/Mexicano/Fachada A/B.jpg" class="img-fluid rounded"
                                                    alt="Mexicano">
                                                <div class="option-title">Mexicano</div>
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
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="1Habitacion"
                                                data-valor="1 habitación" data-precio="0"
                                                onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">01</span>
                                                </div>
                                                <div class="option-title">1 Habitación</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="2Habitaciones" data-valor="2 habitaciones"
                                                data-precio="25000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">02</span>
                                                </div>
                                                <div class="option-title">2 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="3Habitaciones" data-valor="3 habitaciones"
                                                data-precio="40000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">03</span>
                                                </div>
                                                <div class="option-title">3 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer"
                                                data-id="4Habitaciones" data-valor="4 habitaciones"
                                                data-precio="60000" onclick="seleccionarHabitacion(this)">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">04</span>
                                                </div>
                                                <div class="option-title">4 Habitaciones</div>
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
                                        aria-expanded="true" aria-controls="collapse-{{ $category->id }}">

                                        <span class="textAcordeon">{{ $category->name }}</span>
                                        <span class="icon ms-auto">
                                            <!-- Ícono + (más), se muestra cuando está colapsado -->
                                            <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                                height="20" fill="currentColor" viewBox="0 0 16 16"
                                                >
                                                <path
                                                    d="M8 1a.5.5 0 0 1 .5.5v6.5h6.5a.5.5 0 0 1 0 1H8.5V15a.5.5 0 0 1-1 0V9.5H1a.5.5 0 0 1 0-1h6.5V1.5A.5.5 0 0 1 8 1z" />
                                            </svg>
                                            <!-- Ícono − (menos), se muestra cuando está expandido -->
                                            <svg class="minus-icon" xmlns="http://www.w3.org/2000/svg" width="20"
                                                height="20" fill="currentColor" viewBox="0 0 16 16">
                                                <path d="M1 8a.5.5 0 0 1 .5-.5h13a.5.5 0 0 1 0 1h-13A.5.5 0 0 1 1 8z" />
                                            </svg>
                                        </span>
                                    </button>
                                </h2>

                                <div id="collapse-{{ $category->id }}" class="accordion-collapse collapse show"
                                    aria-labelledby="heading-{{ $category->id }}">
                                    <div class="accordion-body">
                                        <p class="fw-bold mb-1">Opciones de {{ $category->name }}</p>
                                        <div class="row g-3" id="opciones-{{ Str::slug($category->name) }}">
                                            @foreach ($category->products as $product)
                                                <div class="col-6 col-md-6">
                                                    <div class="option-card estilo-{{ Str::slug($category->name) }} cursor-pointer"
                                                        data-categoria="{{ Str::slug($category->name) }}"
                                                        data-id="{{ $product->id }}"
                                                        data-renders='@json($product->renders)'
                                                        data-valor="{{ $product->title }}"
                                                        data-precio="{{ $product->base_price }}"
                                                        onclick="seleccionarOpcion(this)">
                                                        <img src="/{{ $product->image_url ?? 'https://via.placeholder.com/400x300' }}"
                                                            class="img-fluid rounded" alt="" width="350px">
                                                        <div class="option-title">{{ $product->title }}</div>
                                                        <div class="option-description">{{ $product->description }}
                                                        </div>
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



    <x-footer />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/Minimalista.js"></script>

</body>

</html>
