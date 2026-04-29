<!DOCTYPE html>
<html lang="es">
<x-head :previewImage="$preview_image ?? null" />
<link rel="stylesheet" href="/assets/cotizador.css?v={{ filemtime(public_path('assets/cotizador.css')) }}">

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
                        <span id="totalPriceUpdating" class="spinner-border spinner-border-sm text-primary ms-2 d-none"
                            role="status" aria-hidden="true"></span>
                    </h4>

                    <p>Bienvenido al configurador de casas UONDR. Explora y personaliza tu casa ideal eligiendo el
                        estilo, número de habitaciones y más. Cuando termines, guarda tu configuración y nos pondremos
                        en contacto contigo para enviarte una propuesta personalizada.</p>


                    <div class="accordion " id="configAccordion">

                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingZonas">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#Zonas" aria-expanded="true" aria-controls="Zonas">
                                    <span class="textAcordeon">¿En dónde quieres vivir?</span>
                                    <x-accordion-toggle-icon class="ms-auto" />
                                </button>
                            </h2>
                            <div id="Zonas" class="accordion-collapse collapse show" aria-labelledby="headingZonas">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Selecciona una zona</p>
                                    <div class="row g-3 opcion-selected" id="opciones-zonas">
                                        @forelse ($zones as $zone)
                                            @php
                                                $zoneImage = $zone->image_url ?: '/img/tulum.jpg';
                                                if (!Str::startsWith($zoneImage, ['http://', 'https://', '/'])) {
                                                    $zoneImage = '/' . ltrim($zoneImage, '/');
                                                }
                                            @endphp
                                            <div class="col-6 col-md-6">
                                                <div class="option-card estilo-color cursor-pointer"
                                                    data-id="zona-{{ $zone->id }}" data-zone-id="{{ $zone->id }}"
                                                    data-categoria="Zona" data-valor="{{ $zone->name }}" data-precio="0"
                                                    onclick="seleccionarOpcion(this)">
                                                    <img src="{{ $zoneImage }}" class="img-fluid rounded"
                                                        alt="{{ $zone->name }}">
                                                    <div class="option-title">{{ $zone->name }}</div>
                                                    <div class="option-description d-none">
                                                        {{ $zone->developments->count() }} desarrollo(s)
                                                    </div>
                                                </div>
                                            </div>
                                        @empty
                                            <div class="col-12">
                                                <div class="alert alert-light mb-0">No hay zonas disponibles.</div>
                                            </div>
                                        @endforelse
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- General -->
                        <div class="accordion-item hover-shadow mb-4">
                            <h2 class="accordion-header" id="headingGeneral">
                                <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#opciones-casas" aria-expanded="true"
                                    aria-controls="opciones-casas">
                                    <span class="textAcordeon">Estilo</span>
                                    <x-accordion-toggle-icon class="ms-auto" />
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
                                    <x-accordion-toggle-icon class="ms-auto" />
                                </button>
                            </h2>
                            <div id="Habitaciones" class="accordion-collapse collapse show"
                                aria-labelledby="headingHabitaciones">
                                <div class="accordion-body">
                                    <p class="fw-bold mb-1">Elige el número de habitaciones</p>
                                    <div class="row g-3 opcion-selected" id="opciones-habitaciones">
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="4Recamaras"
                                                data-valor="4 Recámaras" data-precio="0" data-categoria="Habitaciones">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">04</span>
                                                </div>
                                                <div class="option-title">4 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="3Recamaras"
                                                data-categoria="Habitaciones" data-valor="3 Recámaras" data-precio="0">
                                                <div class="rounded mb-2 bg-habitaciones d-flex align-items-center justify-content-center"
                                                    style="height: 100px;">
                                                    <span class="fw-bold fs-4">03</span>
                                                </div>
                                                <div class="option-title">3 Habitaciones</div>
                                            </div>
                                        </div>
                                        <div class="col-6 col-md-6">
                                            <div class="option-card estilo-color cursor-pointer" data-id="2Recamaras"
                                                data-valor="2 Recámaras" data-precio="0" data-categoria="Habitaciones">
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
                            <div class="accordion-item hover-shadow mb-4" id="item-{{ $category->id }}">
                                <h2 class="accordion-header" id="heading-{{ $category->id }}">
                                    <button class="accordion-button custom-toggle" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapse-{{ $category->id }}" aria-expanded="true"
                                        aria-controls="collapse-{{ $category->id }}">

                                        <span class="textAcordeon">{{ $category->name }}</span>
                                        <x-accordion-toggle-icon class="ms-auto" />
                                    </button>
                                </h2>

                                <div id="collapse-{{ $category->id }}" class="accordion-collapse collapse show"
                                    aria-labelledby="heading-{{ $category->id }}">
                                    <div class="accordion-body">
                                        <p class="fw-bold mb-1">Opciones de {{ $category->name }}</p>
                                        <div class="row g-3 opcion-selected" id="opciones-{{ Str::slug($category->name) }}">
                                            @foreach ($category->products as $product)
                                                @php
                                                    $zonePrices = $product->zonePrices->mapWithKeys(
                                                        function ($price) {
                                                            return [
                                                                (string) $price->zone_id => [
                                                                    'base_price' => $price->base_price !== null ? (float) $price->base_price : null,
                                                                    'precio_a' => (float) $price->fachada_1_price,
                                                                    'precio_b' => (float) $price->fachada_2_price,
                                                                    'precio_2a' => (float) $price->fachada_3_price,
                                                                    'precio_2b' => (float) $price->fachada_4_price,
                                                                    'precio_3a' => (float) $price->fachada_5_price,
                                                                    'precio_3b' => (float) $price->fachada_6_price,
                                                                    'precio_4a' => (float) $price->fachada_7_price,
                                                                ],
                                                            ];
                                                        },
                                                    );
                                                @endphp
                                                <div class="col-6 col-md-6">
                                                    <div class="option-card estilo-{{ Str::slug($category->name) }} cursor-pointer"
                                                        data-categoria="{{ $category->name }}" data-id="{{ $product->id }}"
                                                        data-renders='@json($product->renders)'
                                                        data-fachada-renders='@json($fachadas[$product->id] ?? [])'
                                                        data-zone-prices='@json($zonePrices)' data-valor="{{ $product->title }}"
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

                        <div class="development-section mb-4" id="piaroCard">
                            <h2 class="development-section-title">Desarrollo y lote</h2>
                            <h2 class="development-section-title subtitle-development">Selecciona un desarrollo</h2>
                            <div id="piaroInitialContent">
                                <div class="development-selector-main d-flex flex-column gap-3"
                                    id="developmentSelectorAccordion">
                                    <div class="development-card" style="overflow: visible !important;">
                                        <button class="development-card-toggle collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseDevelopmentPiaro"
                                            aria-expanded="false" aria-controls="collapseDevelopmentPiaro"
                                            style="border-radius: 18px">
                                            <span class="development-card-title">Piaró</span>
                                            <span class="development-badge development-badge-immediate">Entrega
                                                inmediata</span>
                                            <x-accordion-toggle-icon class="ms-auto development-toggle-icon" />
                                        </button>

                                        <div id="collapseDevelopmentPiaro" class="collapse development-card-collapse"
                                            data-bs-parent="#developmentSelectorAccordion">
                                            <div class="development-card-body">
                                                <p class="development-copy mb-2">¿Ya formas parte de Piaró? Busca tu
                                                    lote para continuar.</p>

                                                <div class="position-relative mb-3">
                                                    <input type="text" id="lotInput-33"
                                                        class="form-control development-lot-input"
                                                        data-development-id="33" placeholder="Num. de lote"
                                                        autocomplete="off">
                                                    <input type="hidden" id="lotId-33">
                                                    <div id="lotDropdown-33"
                                                        class="list-group position-absolute w-100 shadow-sm development-lot-dropdown"
                                                        style="z-index:1000; display:none;"></div>
                                                </div>

                                                <button
                                                    class="btn btn-outline-primary w-100 btn-radius js-open-development-modal"
                                                    data-development-id="33" data-bs-toggle="modal"
                                                    data-bs-target="#modalPiaro">Seleccionar lote</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="development-card">
                                        <button class="development-card-toggle collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseDevelopmentPaseo"
                                            aria-expanded="false" aria-controls="collapseDevelopmentPaseo">
                                            <span class="development-card-title">Paseo Península</span>
                                            <span class="development-badge development-badge-presale">Preventa - 20%
                                                Enganche</span>
                                            <x-accordion-toggle-icon class="ms-auto development-toggle-icon" />
                                        </button>

                                        <div id="collapseDevelopmentPaseo" class="collapse development-card-collapse"
                                            data-bs-parent="#developmentSelectorAccordion">
                                            <div class="development-card-body">
                                                <p class="development-copy mb-2">¿Ya formas parte de Paseo Península?
                                                    Busca tu lote para continuar.</p>

                                                <div class="position-relative mb-3">
                                                    <input type="text" id="lotInput-43"
                                                        class="form-control development-lot-input"
                                                        data-development-id="43" placeholder="Num. de lote"
                                                        autocomplete="off" disabled>
                                                    <input type="hidden" id="lotId-43" disabled>
                                                    <div id="lotDropdown-43"
                                                        class="list-group position-absolute w-100 shadow-sm development-lot-dropdown"
                                                        style="z-index:1000; display:none;"></div>
                                                </div>

                                                <button
                                                    class="btn btn-outline-primary w-100 btn-radius js-open-development-modal"
                                                    data-development-id="43" data-bs-toggle="modal"
                                                    data-bs-target="#modalPiaro">Seleccionar lote</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="development-card">
                                        <button class="development-card-toggle collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#collapseDevelopmentHaciendaPiaro"
                                            aria-expanded="false" aria-controls="collapseDevelopmentHaciendaPiaro">
                                            <span class="development-card-title">Hacienda Piaro</span>
                                            <span class="development-badge development-badge-immediate">Entrega
                                                inmediata</span>
                                            <x-accordion-toggle-icon class="ms-auto development-toggle-icon" />
                                        </button>

                                        <div id="collapseDevelopmentHaciendaPiaro"
                                            class="collapse development-card-collapse"
                                            data-bs-parent="#developmentSelectorAccordion">
                                            <div class="development-card-body">
                                                <p class="development-copy mb-2">¿Ya formas parte de Hacienda Piaro?
                                                    Busca tu lote para continuar.</p>

                                                <div class="position-relative mb-3">
                                                    <input type="text" id="lotInput-32"
                                                        class="form-control development-lot-input"
                                                        data-development-id="32" placeholder="Num. de lote"
                                                        autocomplete="off" disabled>
                                                    <input type="hidden" id="lotId-32" disabled>
                                                    <div id="lotDropdown-32"
                                                        class="list-group position-absolute w-100 shadow-sm development-lot-dropdown"
                                                        style="z-index:1000; display:none;"></div>
                                                </div>

                                                <button
                                                    class="btn btn-outline-primary w-100 btn-radius js-open-development-modal"
                                                    data-development-id="32" data-bs-toggle="modal"
                                                    data-bs-target="#modalPiaro">Seleccionar lote</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="development-card">
                                        <button class="development-card-toggle" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#collapseDevelopmentAhawell" aria-expanded="false"
                                            aria-controls="collapseDevelopmentAhawell" disabled>
                                            <span class="development-card-title">Ahawell</span>
                                            <span
                                                class="development-badge development-badge-comming-soon">Próximamente</span>
                                        </button>

                                        <div id="collapseDevelopmentAhawell" class="collapse development-card-collapse"
                                            data-bs-parent="#developmentSelectorAccordion">
                                            <div class="development-card-body">
                                                <h5 class="fw-bold mb-2">¿Ya eres parte de Ahawell?</h5>
                                                <p class="development-copy mb-2">
                                                    Si ya cuentas con un lote en Ahawell, indícanos tu número de lote
                                                    para brindarte
                                                    asesoría personalizada y continuar con tu proyecto.
                                                </p>

                                                <div class="position-relative mb-4">
                                                    <input type="text" id="lotInput-3"
                                                        class="form-control development-lot-input"
                                                        data-development-id="3" placeholder="Num. de lote"
                                                        autocomplete="off" disabled>
                                                    <input type="hidden" id="lotId-3" disabled>
                                                    <div id="lotDropdown-3"
                                                        class="list-group position-absolute w-100 shadow-sm development-lot-dropdown"
                                                        style="z-index:1000; display:none;"></div>
                                                </div>

                                                <h5 class="fw-bold mb-2">¿Aún no tienes lote en Ahawell?</h5>
                                                <p class="development-copy mb-2">
                                                    Ahawell incluye Portal, Chakté, Bayal, Pakal y Chechem.
                                                </p>
                                                <p class="development-copy mb-3">
                                                    Puedes seleccionar tu lote para continuar con tu casa personalizada.
                                                </p>

                                                <button
                                                    class="btn btn-outline-primary w-100 btn-radius js-open-development-modal"
                                                    data-development-id="3" data-bs-toggle="modal"
                                                    data-bs-target="#modalPiaro">Seleccionar lote</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="selectedLotCard" class="d-none development-selected-lot mt-3">
                                <div class="card-body">
                                    <h5 class="fw-bold mb-3" id="lotTitle"></h5>

                                    <div class="row mb-3">
                                        <div class="col-6">
                                            <small class="">Lote</small>
                                            <div class="fw-semibold" id="lotName"></div>
                                        </div>
                                        <div class="col-6">
                                            <small class="">Área</small>
                                            <div class="fw-semibold" id="lotArea"></div>
                                        </div>
                                    </div>

                                    <div class="row mb-3 " id="info-lote">
                                        <div class="col-6">
                                            <small class="">Precio m²</small>
                                            <div class="fw-semibold" id="lotPriceM2"></div>
                                        </div>
                                        <div class="col-6">
                                            <small class="">Precio Total</small>
                                            <div class="fw-semibold" id="lotTotal"></div>
                                        </div>
                                    </div>

                                    <p class="small">
                                        Los precios de materiales y costos de construcción están sujetos a actualización
                                        al momento de concluir el pago del enganche. Históricamente, estos costos han
                                        presentado incrementos aproximados del 5% anual, por lo que el precio final
                                        podrá ajustarse en función de las condiciones vigentes al momento de la
                                        formalización.
                                    </p>

                                    <button class="btn btn-outline-primary w-100 btn-radius" id="changeLotBtn">
                                        Seleccionar otro lote
                                    </button>
                                </div>
                            </div>
                        </div>


                        <div class="card shadow-sm border-0 financing-card">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-3">Financiamiento</h5>
                                <div class="mb-3">
                                    <span id="mensualidad" class="fs-3 fw-bold">$0.00</span>
                                    <span class="text-primary" id="mensualidadHint">/mes estimado</span>
                                </div>

                                <hr>

                                <div class="row mb-3">
                                    <div class="col-6">
                                        <label class="form-label small">Enganche</label>
                                        <select id="selectEnganche" class="form-select">
                                            <option value="0.10">10%</option>
                                            <option value="0.15">15%</option>
                                            <option value="0.20" selected>20%</option>
                                            <option value="0.25">25%</option>
                                        </select>
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label small">Plazo</label>
                                        <select id="selectPlazo" class="form-select">
                                            <option value="3">36 meses</option>
                                            <option value="10">10 años</option>
                                            <option value="15">15 años</option>
                                            <option value="20">20 años</option>
                                            <option value="25" selected>25 años</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-3 g-2 text-center text-md-start">
                                    <div class="col-12 col-md-5">
                                        <small id="financingRateLabel">% Tasa de interés fija anual</small>
                                        <div id="tasa" class="fw-bold fs-6 fs-md-6">11.99%</div>
                                    </div>

                                    <div class="col-6 col-md-3">
                                        <small>Enganche</small>
                                        <div id="anticipo" class="fw-bold fs-6 fs-md-6">$0.00</div>
                                    </div>

                                    <div class="col-6 col-md-4">
                                        <small>Monto financiado</small>
                                        <div id="montoFinanciado" class="fw-bold fs-6 fs-md-6">$0.00</div>
                                    </div>
                                </div>

                                <p class="small text-primary mb-3" id="financingSchemeNote"></p>


                                <div class="mb-4 d-none">
                                    <small class="">Saldo contra entrega 20%</small>
                                    <div id="saldoEntrega" class="fw-bold">$0.00</div>
                                </div>

                                <p class="small ">
                                    Esta simulación es únicamente de carácter referencial. La aprobación final del
                                    crédito está sujeta a la evaluación y autorización de la institución financiera
                                    correspondiente.
                                </p>

                                {{-- BOTONES --}}
                                <div class="d-grid gap-2 mt-4">
                                    <a class="btn btn-primary btn-lg btn-radius capturar">
                                        Siguiente
                                    </a>

                                    <button class="btn btn-outline-primary btn-lg btn-radius" data-bs-toggle="modal"
                                        data-bs-target="#modalAsesor">
                                        Apartar
                                    </button>

                                    <button class="btn btn-outline-primary btn-lg btn-radius"
                                        onclick="compartirConfiguracion()">
                                        Compartir Configuración
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <x-modal-asesor />
    <x-modal-piaro />
    <x-footer />
    <script src="/assets/js/shareConfig.js?v={{ filemtime(public_path('assets/js/shareConfig.js')) }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

    <script>
        /** Variables globales para compartir datos entre scripts. Por ejemplo, la configuración compartida se inyecta aquí desde Laravel y luego se puede acceder desde cualquier script incluido en esta página a través de window.SHARED_CONFIG. */
        window.SHARED_CONFIG = @json($sharedConfig ?? null);
        window.currentStyle = "{{ $style }}";
        window.ZONE_DEVELOPMENT_MAP = @json($zoneDevelopmentMap ?? []);
        window.ZONE_DEVELOPMENTS_BY_ZONE = @json($zoneDevelopmentsByZone ?? []);
        window.DEFAULT_ZONE_ID = @json($defaultZoneId ?? null);

        window.DESARROLLOS_API_URL = 'https://lotes.beskar.mx/api/desarrollos';
        window.LOTS_API_URL = '{{ config('services.naboo.url') }}api/lots';
        window.NABOO_ASSET_BASE_URL = 'https://lotes.beskar.mx';
        window.lotsCache = [];

        const FINANCIAMIENTO = {
            anticipoPorcentaje: 0.20, // default 20%
            tasaAnual: 11.99,         // fija
            plazoAnios: 25            // default 25 años
        };
        window.leadContext = {
            source: 'configurador', // o 'landing'
            configuration: null,
            miniaturas: null,
            total: null,
            lote: null
        };

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/constantes.js?v={{ filemtime(public_path('constantes.js')) }}"></script>
    <script src="/Minimalista.js?v={{ filemtime(public_path('Minimalista.js')) }}"></script>
    <script src="/cambioBasesFachadas.js?v={{ filemtime(public_path('cambioBasesFachadas.js')) }}"></script>
    <script src="/assets/js/core/globals.js?v={{ filemtime(public_path('assets/js/core/globals.js')) }}"></script>
    <script src="/assets/js/ui/capture.js?v={{ filemtime(public_path('assets/js/ui/capture.js')) }}"></script>
    <script src="/assets/js/ui/reload-modal.js?v={{ filemtime(public_path('assets/js/ui/reload-modal.js')) }}"></script>
    <script src="/assets/js/ui/info-modal.js?v={{ filemtime(public_path('assets/js/ui/info-modal.js')) }}"></script>
    <script src="/assets/js/piaro-map.js?v={{ filemtime(public_path('assets/js/piaro-map.js')) }}"></script>
    <script src="/assets/js/app.js?v={{ filemtime(public_path('assets/js/app.js')) }}"></script>

</body>

</html>
