<!DOCTYPE html>
<html lang="es">

<x-head />
<link rel="stylesheet" href="/assets/cotizador.css">


<body class="general-background">

    <!-- Header fijo -->
    <x-header />

    <!-- Contenido principal -->
    <div class="container-fluid">
        <div class="row">

            <!-- Columna de 8 con contenido sticky -->
            <div class="col-md-8">
                <div class="sticky-content">
                    <div class="gallery-wrapper">
                        <!-- Imagen de previsualización principal -->
                        <div class="preview-image text-center" style="position: relative;">
                            <img id="mainPreview" src="/base.jpg" alt="Vista previa" class="img-fluid preview-img">
                            <div id="imageLoader" class="image-loader" style="display:none;">
                                <div class="spinner-border text-primary" role="status" style="width:3rem;height:3rem;">
                                    <span class="visually-hidden">Cargando...</span>
                                </div>
                            </div>
                        </div>

                        <!-- Carrusel de miniaturas -->
                        <div id="owl-demo" class="owl-carousel gallery-carousel">
                            @foreach ($baseImages as $image)
                                <div class="item">
                                    <img src="{{ $image->path }}" alt="imagen {{ $loop->iteration }}"
                                        class="thumb tumb-original" @if ($image->overlay)
                                        data-overlay="/{{ $image->overlay }}" @endif />
                                    <div class="overlay-container"
                                        style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;">
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
            <!-- Columna de 4 con mucho contenido scrollable -->
            <div class="col-md-4 mt-100">
                <div class="long-content">

                    <h4 class="fw-bold precio-total azulFuerte precio-sticky">
                        <img src="/img/tag.svg" alt="">
                        <span id="precioTotal">$0 MXN</span>
                    </h4>

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
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            fill="currentColor" viewBox="0 0 16 16">
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
                            <div id="Estilos" class="accordion-collapse collapse show" aria-labelledby="headingGeneral">
                                <div class="accordion-body">
                                    <div class="row g-3 opcion-selected" id="opciones-casas">
                                        <div class="col-6 col-md-6">
                                            <a href="/home">
                                                <div class="option-card" data-id="generalMinimalista"
                                                    data-categoria="Estilo" data-valor="Minimalista">
                                                    <img src="/productos/MINIMALISTA-MINIATURA.webp"
                                                        class="img-fluid rounded" alt="Minimalista">
                                                    <div class="option-title">Minimalista</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <a href="/tulum">
                                                <div class="option-card" data-id="generalTulum" data-categoria="Estilo"
                                                    data-valor="Tulum">
                                                    <img src="/productos/TULUM-MINIATURA.webp" class="img-fluid rounded"
                                                        alt="Tulum">
                                                    <div class="option-title">Tulum</div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <a href="/mexicano">
                                                <div class="option-card" data-id="generalMexicano"
                                                    data-categoria="Estilo" data-valor="Mexicano">
                                                    <img src="/productos/MEXICANO-MINIATURA.webp"
                                                        class="img-fluid rounded" alt="Mexicano">
                                                    <div class="option-title">Mexicano</div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Número de habitaciones -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingHabitaciones">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#Habitaciones" aria-expanded="true" aria-controls="Habitaciones">
                                    <span class="textAcordeon">Número de habitaciones</span>
                                    <span class="icon ms-auto">
                                        <!-- PLUS ICON -->
                                        <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                            fill="currentColor" viewBox="0 0 16 16">
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
                                    <div class="row g-3 opcion-selected" id="opciones-habitaciones">
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="4Recamaras"
                                                data-valor="4 Recámaras" data-precio="0"
                                                data-categoria="Habitaciones">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">04</span>
                                                </div>
                                                <div class="option-title">4 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="3Recamaras"
                                                data-categoria="Habitaciones" data-valor="3 Recámaras"
                                                data-precio="0">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">03</span>
                                                </div>
                                                <div class="option-title">3 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="2Recamaras"
                                                data-valor="2 Recámaras" data-precio="0"
                                                data-categoria="Habitaciones">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">02</span>
                                                </div>
                                                <div class="option-title">2 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="1Recamara"
                                                data-categoria="Habitaciones" data-valor="1 Recámara" data-precio="0">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">01</span>
                                                </div>
                                                <div class="option-title">1 Habitación</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        @foreach ($categories as $category)
                            <div class="accordion-item hover-shadow mb-4">
                                <h2 class="accordion-header" id="heading-{{ $category->id }}">
                                    <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse-{{ $category->id }}" aria-expanded="true"
                                        aria-controls="collapse-{{ $category->id }}">

                                        <span class="textAcordeon">{{ $category->name }}</span>
                                        <span class="icon ms-auto">
                                            <!-- Ícono + (más), se muestra cuando está colapsado -->
                                            <svg class="plus-icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                                fill="currentColor" viewBox="0 0 16 16">
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
                                        <div class="row g-3 opcion-selected" id="opciones-{{ Str::slug($category->name) }}">
                                            @foreach ($category->products as $product)
                                                <div class="col-6 col-md-6">
                                                    <div class="option-card estilo-{{ Str::slug($category->name) }} cursor-pointer"
                                                        data-categoria="{{ $category->name }}" data-id="{{ $product->id }}"
                                                        data-renders='@json($product->renders)'
                                                        data-fachada-renders='@json($fachadas[$product->id] ?? [])'
                                                        data-valor="{{ $product->title }}"
                                                        data-precio="{{ $product->base_price }}"
                                                        data-precio_a="{{ $product->fachada_1_price }}"
                                                        data-precio_b="{{ $product->fachada_2_price }}"
                                                        data-precio_2a="{{ $product->fachada_3_price }}"
                                                        data-precio_2b="{{ $product->fachada_4_price }}"
                                                        data-precio_3a="{{ $product->fachada_5_price }}"
                                                        data-precio_3b="{{ $product->fachada_6_price }}"
                                                        data-precio_4a="{{ $product->fachada_7_price }}"
                                                        data-pre_code="{{ $product->pre_code }}"
                                                        data-variant_code="{{ $product->variant_code }}"
                                                        onclick="seleccionarOpcion(this)">

                                                        <img src="/{{ $product->image_url ?? 'https://via.placeholder.com/400x300' }}"
                                                            class="img-fluid rounded" alt="" width="350px">
                                                        <div class="option-title">{{ $product->title }}</div>
                                                        <div class="option-description">{{ $product->description }}</div>
                                                        <div class="option-description precio-producto">
                                                            @if ($product->fachada_7_price == 0)
                                                                <span></span>
                                                            @else
                                                                {{ number_format($product->fachada_7_price, 2, '.', ',') }}
                                                            @endif
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
    <script src="/constantes.js"></script>
    <script src="/Minimalista.js"></script>
    <script src="/cambioBasesFachadas.js"></script>

    <script>
        document.querySelectorAll('.capturar').forEach(btn => {
            btn.addEventListener('click', () => {
                // Seleccionamos todos los thumb-wrapper
                const wrappers = document.querySelectorAll('.thumb-wrapper');

                // Creamos un array con la info de base y overlays
                const miniaturasData = Array.from(wrappers).map(wrapper => {
                    const base = wrapper.querySelector('img.tumb-original')?.src || '';
                    const overlays = Array.from(wrapper.querySelectorAll('.overlay-container img')).map(img => img.src);
                    return {
                        base,
                        overlays
                    };
                });

                // Guardamos en localStorage
                localStorage.setItem('miniaturasData', JSON.stringify(miniaturasData));

                // Redirigimos a la página de resumen
                window.location.href = '/resumen';
            });
        });
    </script>
</body>

</html>