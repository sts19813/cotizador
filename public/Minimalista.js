/**********************************************************
 * VARIABLES GLOBALES
 **********************************************************/
let selections = {};
let globalindex = 0;
let activeOverlays = {};
let selectedFachada = null;
let currentLoadToken = 0; // Loader helpers y token global
const OVERLAY_TRANSITION_MS = 1500;

const PREVENTA_DEVELOPMENT_IDS = new Set([43, 3, 2, 14, 8, 9, 10]);

/**********************************************************
 * LOADER
 **********************************************************/
function showLoader() {
  $('#imageLoader').show();
}
function hideLoader() {
  $('#imageLoader').fadeOut(120);
}

function actualizarPrecioPrincipal(precio) {
  const precioEl = document.getElementById('precioTotal');
  if (!precioEl) return;

  if (precio === 0) {

  } else {
    precioEl.textContent = '$' + Number(precio)
      .toLocaleString('es-MX', { minimumFractionDigits: 2 }) + ' MXN';
    precioEl.classList.remove("incluido");
  }
}

/**********************************************************
 * PREPARACIÓN DE MINIATURAS Y OVERLAYS
 **********************************************************/
function prepararMiniaturas() {
  $('.gallery-carousel .item').each(function () {
    const img = $(this).find('img.thumb');
    if (!img.parent().hasClass('thumb-wrapper')) {
      img.wrap('<div class="thumb-wrapper" style="position:relative;"></div>');
      img.after('<div class="overlay-container" class="thumb" style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;"></div>');
    }
  });
}

function isValidImageUrl(url) {
  if (!url) return false;
  if (typeof url !== 'string') return false;
  url = url.trim();
  // Solo aceptar extensiones de imagen comunes
  return /\.(jpg|jpeg|png|gif|webp|svg)$/i.test(url);
}

function updateThumbnailOverlay(index, options = {}) {
  const { animate = true } = options;
  const $thumbWrapper = $('.gallery-carousel .owl-item').eq(index).find('.thumb-wrapper');
  const $overlayContainer = $thumbWrapper.find('.overlay-container');
  const overlayContainer = $overlayContainer.get(0);
  if (!overlayContainer) return;

  syncOverlayImages(overlayContainer, activeOverlays[index] || [], true, animate);
}

function updateMainPreview(index, options = {}) {
  const { animate = true } = options;
  const mainPreview = document.getElementById('mainPreview');
  const previewWrapper = mainPreview.parentElement;

  let overlayMainContainer = document.getElementById('overlayMainContainer');
  if (!overlayMainContainer) {
    overlayMainContainer = document.createElement('div');
    overlayMainContainer.id = 'overlayMainContainer';
    overlayMainContainer.style.position = 'absolute';
    overlayMainContainer.style.top = '0';
    overlayMainContainer.style.left = '0';
    overlayMainContainer.style.width = '100%';
    overlayMainContainer.style.height = '100%';
    overlayMainContainer.style.pointerEvents = 'none';
    overlayMainContainer.style.userSelect = 'none';

    previewWrapper.style.position = 'relative';
    previewWrapper.appendChild(overlayMainContainer);
  }

  syncOverlayImages(overlayMainContainer, activeOverlays[index] || [], false, animate);
}

function syncOverlayImages(container, overlays, isThumb = false, animate = true) {
  const normalized = [];
  const byKey = new Map();

  overlays.forEach((ov, order) => {
    if (!ov || !isValidImageUrl(ov.url)) return;
    const key = String(ov.categoria || `overlay_${order}`);
    const item = { key, url: ov.url, order };
    normalized.push(item);
    byKey.set(key, item);
  });

  const existing = Array.from(container.querySelectorAll('[data-overlay-key]'));

  // Remover overlays que ya no existen en el estado actual
  existing.forEach(el => {
    const key = el.dataset.overlayKey;
    if (!byKey.has(key)) {
      el.remove();
    }
  });

  // Aplicar/animar solo overlays nuevos o cambiados
  normalized.forEach(item => {
    const current = container.querySelector(`[data-overlay-key="${escapeSelectorValue(item.key)}"]`);
    const baseClass = isThumb ? 'thumb thumb-overlay-image' : 'main-overlay-image';

    if (!current) {
      const img = document.createElement('img');
      img.src = item.url;
      img.dataset.overlayKey = item.key;
      img.dataset.overlayUrl = item.url;
      img.className = baseClass;
      img.style.width = '100%';
      img.style.height = '100%';
      img.style.position = 'absolute';
      img.style.top = '0';
      img.style.left = '0';
      img.style.pointerEvents = 'none';
      img.style.opacity = animate ? '0' : '1';
      img.style.transition = animate ? `opacity ${OVERLAY_TRANSITION_MS}ms ease` : 'none';
      img.style.zIndex = String(100 + item.order);
      container.appendChild(img);
      if (animate) {
        requestAnimationFrame(() => {
          img.style.opacity = '1';
        });
      }
      return;
    }

    current.style.zIndex = String(100 + item.order);

    // Si la URL no cambió, no animar nada (evita reanimar overlays antiguos)
    if (current.dataset.overlayUrl === item.url) return;

    if (!animate) {
      current.src = item.url;
      current.dataset.overlayUrl = item.url;
      current.style.opacity = '1';
      current.style.transition = 'none';
      return;
    }

    // Evitar nodos duplicados por key (esto causaba overlays "pegados" y clics extra)
    current.style.transition = `opacity ${OVERLAY_TRANSITION_MS}ms ease`;
    current.style.opacity = '0';
    current.src = item.url;
    current.dataset.overlayUrl = item.url;
    requestAnimationFrame(() => {
      current.style.opacity = '1';
    });
  });
}

function escapeSelectorValue(value) {
  if (window.CSS && typeof window.CSS.escape === 'function') {
    return window.CSS.escape(value);
  }
  return String(value).replace(/["\\]/g, '\\$&');
}

function extractRenderUrlsFromPayload(payload, urls) {
  if (!payload) return;

  if (typeof payload === 'string') {
    if (isValidImageUrl(payload)) urls.add(payload);
    return;
  }

  if (Array.isArray(payload)) {
    payload.forEach(v => extractRenderUrlsFromPayload(v, urls));
    return;
  }

  if (typeof payload === 'object') {
    Object.values(payload).forEach(v => extractRenderUrlsFromPayload(v, urls));
  }
}

function preloadAllRenderImages() {
  const urls = new Set();

  document.querySelectorAll('.option-card').forEach(card => {
    extractRenderUrlsFromPayload(card.dataset.renders, urls);
    extractRenderUrlsFromPayload(card.dataset.fachadaRenders, urls);
  });

  document.querySelectorAll('#owl-demo img').forEach(img => {
    const src = img.getAttribute('src');
    const overlay = img.getAttribute('data-overlay');
    if (isValidImageUrl(src)) urls.add(src);
    if (isValidImageUrl(overlay)) urls.add(overlay);
  });

  const queue = Array.from(urls);
  if (!queue.length) return;

  const maxConcurrent = 10;
  let inFlight = 0;
  let i = 0;

  const pump = () => {
    while (inFlight < maxConcurrent && i < queue.length) {
      const url = queue[i++];
      inFlight++;
      const img = new window.Image();
      img.onload = img.onerror = () => {
        inFlight--;
        pump();
      };
      img.src = url;
    }
  };

  if ('requestIdleCallback' in window) {
    window.requestIdleCallback(() => pump(), { timeout: 1200 });
  } else {
    setTimeout(pump, 300);
  }
}


/**********************************************************
 * CAMBIO DE IMÁGENES DEL CARRUSEL
 **********************************************************/
function cambiarImagen(index) {
  globalindex = index;
  const $carousel = $('.gallery-carousel');
  const $preview = $('#mainPreview');

  $carousel.trigger('to.owl.carousel', [index, 300]);

  const $thumb = $carousel.find('.owl-item').eq(index).find('img.thumb');
  if ($thumb.length) {
    const newSrc = $thumb.attr('src');
    const token = ++currentLoadToken;
    showLoader();
    const img = new window.Image();
    img.onload = function () {
      if (token !== currentLoadToken) return;

      // Primero limpiamos overlays de la principal para evitar "renders viejos" en la transición.
      const overlayMainContainer = document.getElementById('overlayMainContainer');
      if (overlayMainContainer) overlayMainContainer.innerHTML = '';

      $preview.addClass('fade-out');
      setTimeout(() => {
        $preview.attr('src', newSrc).removeClass('fade-out');

        // Primero se actualiza la imagen principal; luego, ya cargada, se aplican overlays.
        requestAnimationFrame(() => {
          updateMainPreview(index, { animate: false });
        });
        hideLoader();
      }, 180);
    };
    img.onerror = function () {
      if (token !== currentLoadToken) return;
      hideLoader();
    };
    img.src = newSrc;

    $('.gallery-carousel .thumb-wrapper').removeClass('thumb-selected');
    $thumb.closest('.thumb-wrapper').addClass('thumb-selected');
  }
}

function getSelectedDevelopmentId() {
  const developmentId = Number(
    selections?.lote?.development_id ??
    selections?.lote?.desarrollo_id ??
    0
  );

  return Number.isNaN(developmentId) ? 0 : developmentId;
}

function getFinancingMode() {
  const developmentId = getSelectedDevelopmentId();
  if (PREVENTA_DEVELOPMENT_IDS.has(developmentId)) return 'PREVENTA';
  return 'PIARO';
}

function setFinancingUIByMode(mode) {
  const selectEnganche = document.getElementById('selectEnganche');
  const selectPlazo = document.getElementById('selectPlazo');
  const tasaLabel = document.getElementById('financingRateLabel');
  const tasaValue = document.getElementById('tasa');
  const mensualidadHint = document.getElementById('mensualidadHint');
  const schemeNote = document.getElementById('financingSchemeNote');

  if (mode === 'PREVENTA') {
    if (selectEnganche) {
      selectEnganche.value = '0.20';
      selectEnganche.disabled = true;
    }

    if (selectPlazo) {
      selectPlazo.value = '3';
      selectPlazo.disabled = true;
    }

    if (tasaLabel) tasaLabel.textContent = 'Esquema de preventa';
    if (tasaValue) tasaValue.textContent = '20% del total';
    if (mensualidadHint) mensualidadHint.textContent = '/mes a 36 meses';
    if (schemeNote) {
      schemeNote.textContent = 'En Ahawell y Paseo Península aplicas un esquema especial de preventa con solo 20% de anticipo y el resto se definira mediante un credito hipotecario';
    }
    return;
  }

  if (selectEnganche) selectEnganche.disabled = false;
  if (selectPlazo) {
    selectPlazo.disabled = false;

    if (Number(selectPlazo.value) === 3) {
      selectPlazo.value = String(FINANCIAMIENTO.plazoAnios || 25);
    }
  }

  if (tasaLabel) tasaLabel.textContent = '% Tasa de interés fija anual';
  if (tasaValue) tasaValue.textContent = `${Number(FINANCIAMIENTO.tasaAnual || 0).toFixed(2)}%`;
  if (mensualidadHint) mensualidadHint.textContent = '/mes estimado';
  if (schemeNote) schemeNote.textContent = '';
}

function actualizarFinanciamiento(total) {
  if (!total || total <= 0) return;

  window.precioTotalActual = total;

  const mode = getFinancingMode();
  setFinancingUIByMode(mode);

  if (mode === 'PREVENTA') {
    const baseFinanciable = total * 0.20;
    const anticipo = baseFinanciable * 0.20;
    const montoFinanciado = baseFinanciable * 0.80;
    const mensualidad = montoFinanciado / 36;

    document.getElementById('mensualidad').textContent = formatoMXN(mensualidad);
    document.getElementById('montoFinanciado').textContent = formatoMXN(montoFinanciado);
    document.getElementById('anticipo').textContent = formatoMXN(anticipo);
    return;
  }

  const { anticipoPorcentaje, tasaAnual, plazoAnios } = FINANCIAMIENTO;
  const plazoMeses = plazoAnios * 12;
  const anticipo = total * anticipoPorcentaje;
  const montoFinanciado = total - anticipo;
  const tasaMensual = (tasaAnual / 100) / 12;

  // Amortización francesa
  const mensualidad = (montoFinanciado * tasaMensual) /
    (1 - Math.pow(1 + tasaMensual, -plazoMeses));

  document.getElementById('mensualidad').textContent = formatoMXN(mensualidad);
  document.getElementById('montoFinanciado').textContent = formatoMXN(montoFinanciado);
  document.getElementById('anticipo').textContent = formatoMXN(anticipo);
}

function recalcularPrecioTotal() {
  let total = 0;

  console.clear();
  console.log("===== DETALLE DE SUMA =====");

  // 🟦 Fachada (suma única desde el número)
  if (selections["precio_base_fachada"]) {
    const precioFachada = parseFloat(selections["precio_base_fachada"]);
    console.log("FACHADA:", precioFachada);
    total += precioFachada;
  }

  // 🟦 Lote de piaro
  if (selections["lote"] && selections["lote"].suma === true) {
    const loteTotal = parseFloat(selections["lote"].total) || 0;
    console.log("LOTE:", loteTotal);
    total += loteTotal;
  }

  // Productos (ignorar la key de fachada para no duplicar)
  Object.keys(selections).forEach(key => {
    if (key === "precio_base_fachada" || key === "opciones-fachada") return; // <-- importante
    const item = selections[key];

    if (item && item.precio) {
      const precioProducto = parseFloat(item.precio);
      console.log(`PRODUCTO (${key}):`, precioProducto);
      total += precioProducto;
    }
  });

  console.log("============================");
  console.log("TOTAL CALCULADO:", total);
  console.log("============================");

  actualizarPrecioPrincipal(total);
  actualizarFinanciamiento(total);
}

function formatoMXN(numero) {
  return numero.toLocaleString('es-MX', {
    style: 'currency',
    currency: 'MXN'
  });
}


/**********************************************************
 * SELECCIONAR OPCIONES
 **********************************************************/
function seleccionarOpcion(elemento) {
  const categoria = elemento.getAttribute('data-categoria');
  const valor = elemento.getAttribute('data-valor');

  // ===== Fachada =====
  if (categoria === 'Fachada') {
    selectedFachada = valor;

    const precioBase = parseFloat(elemento.dataset.precio) || 0;
    selections["precio_base_fachada"] = precioBase;

    // Actualizar precio principal
    actualizarPrecioPrincipal(precioBase);

    const rendersFachada = JSON.parse(elemento.getAttribute('data-fachada-renders'));
    const fachadaData = rendersFachada[selectedFachada];
    const items = document.querySelectorAll('#owl-demo .item img.tumb-original');
    CambioBases(items, valor);

    if (fachadaData) {
      for (let i = 0; i < 4; i++) {
        const src = fachadaData[`base_image_${i + 1}`];
        if (src && items[i]) items[i].src = src;
      }
      items[0].dispatchEvent(new Event('click', { bubbles: true }));
    }

    Object.keys(activeOverlays).forEach(idx => {
      activeOverlays[idx] = [];
      updateThumbnailOverlay(idx);
    });
    const overlayMainContainer = document.getElementById('overlayMainContainer');
    if (overlayMainContainer) overlayMainContainer.innerHTML = '';

    // EN LUGAR de autoSelectFirstOptions(); ... -> llamamos a la nueva función que reaplica todo
    refreshSelectionsAndOverlays();

    // === ACTUALIZAR PRECIOS AL CAMBIAR DE FACHADA ===
    const fachada = valor.trim().toLowerCase(); // ej. 'fachada 3a'
    const sufijo = fachada.replace('fachada', '').trim(); // '3a'
    const precioKey = 'precio_' + sufijo; // ej. 'precio_3a'

    document.querySelectorAll('.option-card').forEach(card => {
      const nuevoPrecio = parseFloat(card.dataset[precioKey]) || parseFloat(card.dataset.precio) || 0;
      const priceLabel = card.querySelector('.precio-producto');

      // Mostrar nuevo precio en UI
      if (priceLabel) {
        if (nuevoPrecio === 0) {
        } else {
          priceLabel.textContent = formatoMXN(nuevoPrecio);
          priceLabel.classList.remove("incluido");
        }
      }

      // Actualizar atributo para futuros clics
      card.dataset.precio = nuevoPrecio;

      // 🔥 CORRECCIÓN IMPORTANTE:
      // Si esta tarjeta está seleccionada, actualizar también selections[groupId].precio
      if (card.classList.contains('selected')) {
        const group = card.closest('.accordion-collapse');
        const groupId = group?.id || 'sin-id';

        if (selections[groupId]) {
          selections[groupId].precio = nuevoPrecio;
        }
      }
    });

    // Guardar selections corregido
    localStorage.setItem('selections', JSON.stringify(selections));

    // Recalcular total una vez que TODAS las selecciones tienen el precio correcto
    recalcularPrecioTotal();


    return;
  }


  // ===== Productos =====
  const renders = JSON.parse(elemento.getAttribute('data-renders'));
  const fachadaRenders = selectedFachada
    ? JSON.parse(elemento.getAttribute('data-fachada-renders'))[selectedFachada]
    : null;

  Object.keys(activeOverlays).forEach(idx => {
    activeOverlays[idx] = activeOverlays[idx]?.filter(o => {
      return o.categoria !== categoria && o.categoria !== 'Fachada_' + categoria;
    }) || [];
  });

  if (renders) {
    Object.keys(renders).forEach(key => {
      const imgPath = renders[key];
      if (imgPath) {
        const index = parseInt(key.split('_')[1]) - 1;
        if (!activeOverlays[index]) activeOverlays[index] = [];
        activeOverlays[index].push({ categoria, url: imgPath });
      }
    });
  }

  if (fachadaRenders) {
    for (let i = 1; i <= 4; i++) {
      const imgPath = fachadaRenders[`base_image_${i}`];
      if (imgPath) {
        const index = i - 1;
        if (!activeOverlays[index]) activeOverlays[index] = [];
        activeOverlays[index].push({ categoria: 'Fachada_' + categoria, url: imgPath });
      }
    }
  }

  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx, { animate: true }));
  updateMainPreview(globalindex, { animate: true });
}


/**********************************************************
 * EVENTOS
 **********************************************************/
$(document).on('click', '.accordion-button', function () {
  const section = $(this).closest('.accordion-item').find('.row');
  const index = section.data('carousel-index');
  if (index !== undefined) {
    cambiarImagen(index);
  }
});

$(() => {
  const $carousel = $('.gallery-carousel');
  const $preview = $('#mainPreview');

  $carousel.owlCarousel({
    items: 10,
    margin: 10,
    nav: true,

    mouseDrag: true,     // arrastre con mouse
    touchDrag: true,     // arrastre táctil
    pullDrag: true,

    dots: false,
    navText: [
      '<img src="/img/Vector.svg" alt="prev" style="width:24px;transform: rotate(180deg);">',
      '<img src="/img/Vector.svg" alt="next" style="width:24px;">'
    ],
    autoWidth: true,
  });

  // Soporte trackpad
  $carousel.on('wheel', function (e) {
    if (e.originalEvent.deltaX !== 0) {
      e.preventDefault();
      if (e.originalEvent.deltaX > 0) {
        $carousel.trigger('next.owl');
      } else {
        $carousel.trigger('prev.owl');
      }
    }
  });

  $carousel.on('click', '.thumb', function () {
    const index = $(this).closest('.owl-item').index();
    cambiarImagen(index);
  });

  cambiarImagen(0);

  const observerOptions = {
    root: null,
    rootMargin: '-40% 0px -40% 0px',
    threshold: 0.5
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const seccion = secciones.find(s => s.id === '#' + entry.target.id);
        if (seccion && seccion.carouselIndex !== globalindex) {
          cambiarImagen(seccion.carouselIndex);
          console.log(seccion.carouselIndex);
        }
      }
    });
  }, observerOptions);

  secciones.forEach(s => {
    const el = document.querySelector(s.id);
    if (el) observer.observe(el);
  });

  prepararMiniaturas();
});


/**********************************************************
 * OPCIONES Y SELECCIONES
 **********************************************************/
/**********************************************************
 * OPCIONES Y SELECCIONES (handler actualizado)
 **********************************************************/
document.querySelectorAll('.option-card').forEach(card => {
  card.addEventListener('click', function () {
    const group = this.closest('.accordion-collapse');
    const groupId = group?.id || 'sin-id';

    // UI: marcar seleccionado
    group?.querySelectorAll('.option-card').forEach(c => c.classList.remove('selected'));
    this.classList.add('selected');

    // Extraer todos los atributos data-
    const data = {};
    Array.from(this.attributes).forEach(attr => {
      if (attr.name.startsWith('data-')) {
        const key = attr.name.replace('data-', '').replace(/-/g, '_');
        data[key] = attr.value;
      }
    });

    // Validar precios
    if (data.precio) data.precio = parseFloat(data.precio) || 0;

    // Si falta la categoría, la obtiene desde el DOM
    if (!data.categoria) {
      data.categoria = this.getAttribute('data-categoria') || groupId.replace('opciones-', '');
    }

    // Si falta el valor visible, lo toma del contenido interno
    if (!data.valor) {
      const label = this.querySelector('.card-title, .card-text, .option-title');
      data.valor = label ? label.textContent.trim() : 'Sin nombre';
    }

    // ----- Manejo especial para Fachada: no guardamos la fachada como selección de grupo -----
    if (data.categoria && data.categoria.toLowerCase() === 'fachada' || groupId === 'opciones-fachada') {
      //guarda la fachada para el resumen
      selections["opciones-fachada"] = {
        categoria: data.categoria,
        valor: data.valor,
        precio: data.precio,
        id: data.id || null,
        renders: data.renders || null,
        fachada_renders: data.fachada_renders || null
      };

      // Guardar solo el precio base de fachada (número) para evitar doble conteo
      selections["precio_base_fachada"] = data.precio || 0;

      // Persistir (incluimos números en la limpieza para que se guarde)
      const cleaned = Object.fromEntries(
        Object.entries(selections).filter(([k, v]) => v !== null && v !== undefined && (typeof v === 'object' || typeof v === 'number'))
      );
      localStorage.setItem('selections', JSON.stringify(cleaned));

      // Recalcular total y aplicar overlays/logic vía seleccionarOpcion (si hace falta)
      recalcularPrecioTotal();

      // Llamamos a la función de selección para que aplique renders/overlays si es necesario
      try { seleccionarOpcion(this); } catch (e) { /* ignore */ }

      return; // terminamos aquí para evitar guardar la fachada como grupo normal
    }

    // Guarda selección normal (no fachada)
    selections[groupId] = data;

    // 🔹 Quita cualquier valor nulo o roto antes de guardar (incluimos números para fachada si existen)
    const cleaned = Object.fromEntries(
      Object.entries(selections).filter(([k, v]) => v !== null && v !== undefined && (typeof v === 'object' || typeof v === 'number'))
    );

    localStorage.setItem('selections', JSON.stringify(cleaned));

    // Recalcular el total (la fachada no será contada aquí porque no está en selections[groupId])
    recalcularPrecioTotal();
  });
});


/**********************************************************
 * AUTO-SELECCIÓN AL CARGAR
 **********************************************************/
document.addEventListener('DOMContentLoaded', function () {

  document.getElementById('selectEnganche').addEventListener('change', e => {
    if (getFinancingMode() !== 'PIARO') return;
    FINANCIAMIENTO.anticipoPorcentaje = parseFloat(e.target.value);
    actualizarFinanciamiento(window.precioTotalActual);
  });

  document.getElementById('selectPlazo').addEventListener('change', e => {
    if (getFinancingMode() !== 'PIARO') return;
    const plazoSeleccionado = parseInt(e.target.value);
    if (plazoSeleccionado === 3) {
      e.target.value = String(FINANCIAMIENTO.plazoAnios || 25);
      return;
    }
    FINANCIAMIENTO.plazoAnios = plazoSeleccionado;
    actualizarFinanciamiento(window.precioTotalActual);
  });

  document.querySelectorAll('.row.g-3[id^="opciones-"]').forEach(row => {
    if (row.id === 'opciones-casas') return;
    const firstOption = row.querySelector('.option-card');
    if (firstOption) firstOption.click();
  });

  setTimeout(() => {
    const recamara = document.querySelector('#Habitaciones [data-id="4Recamaras"]');
    if (recamara && !recamara.classList.contains('selected')) recamara.click();

    // 🔥 Forzar selección de las primeras opciones en todas las categorías
    autoSelectFirstOptions();
    Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx));
    updateMainPreview(globalindex);
  }, 300);

  // ===============================
  // Auto-selección de estilo según slug
  // ===============================
  let slug = window.location.pathname.split("/").filter(Boolean).pop() || "home";

  let estiloId = null;
  if (slug === "home") estiloId = "generalMinimalista";
  if (slug === "tulum") estiloId = "generalTulum";
  if (slug === "mexicano") estiloId = "generalMexicano";

  if (estiloId) {
    const estiloCard = document.querySelector(`#opciones-casas .option-card[data-id="${estiloId}"]`);
    if (estiloCard && !estiloCard.classList.contains("selected")) {

      estiloCard.classList.add("selected");

      const data = {};
      Array.from(estiloCard.attributes).forEach(attr => {
        if (attr.name.startsWith("data-")) {
          const key = attr.name.replace("data-", "").replace(/-/g, "_");
          data[key] = attr.value;
        }
      });
      if (data.precio) data.precio = parseFloat(data.precio) || 0;
      selections["opciones-casas"] = data;

      localStorage.setItem("selections", JSON.stringify(selections));
    }
  }

  setTimeout(() => {
    const items = document.querySelectorAll('#owl-demo .item img.tumb-original');
    CambioBases(items, 'Fachada 4A');
  }, 400);

  preloadAllRenderImages();
});

//para hacer la seleccion del primera opcion al cambio de fachada
function autoSelectFirstOptions() {
  document.querySelectorAll('.row.g-3[id^="opciones-"]').forEach(row => {
    if (row.id === 'opciones-casas' || row.id === 'opciones-fachada' || row.id === 'opciones-habitaciones') return;
    const firstOption = row.querySelector('.option-card');
    if (firstOption && !firstOption.classList.contains('selected')) {
      // Disparar click para mantener coherencia de UI y estado
      firstOption.click();
      // Y forzar la aplicación de overlays (por si el click solo marca la opción pero no aplica overlays)
      try { seleccionarOpcion(firstOption); } catch (e) { /* ignore si no tiene data-renders */ }
    }
  });
}

/**
 * Reinicia y reaplica todas las selecciones de opciones (excepto casas, fachadas y habitaciones),
 * asegurando que los overlays se reconstruyan y se sincronicen con las miniaturas y la vista principal.
 *
 * Flujo de la función:
 * 1. Limpia todos los overlays internos (`activeOverlays`) y también los contenedores visuales
 *    de miniaturas y preview principal.
 * 2. Recorre todos los grupos de opciones (`.row.g-3[id^="opciones-"]`).
 *    - Ignora los grupos "casas", "fachada" y "habitaciones".
 *    - Si el grupo ya tiene una opción seleccionada, la reaplica.
 *    - Si no tiene ninguna seleccionada, selecciona la primera opción del grupo y la guarda en `selections`.
 *    - En ambos casos, llama a `seleccionarOpcion(option)` para reconstruir los overlays y la lógica de renderizado.
 * 3. Finalmente, actualiza las miniaturas y el preview principal para reflejar los overlays reaplicados.
 *
 * Uso típico:
 * - Se llama cuando se cambia de fachada o de habitaciones, para mantener
 *   las selecciones previas de color, piso, meseta, etc., en vez de perderlas.
 */
function refreshSelectionsAndOverlays() {
  // 🔹 1. Resetear overlays en memoria
  activeOverlays = {};

  // 🔹 2. Limpiar visualmente overlays en miniaturas
  const thumbCount = $('.gallery-carousel .owl-item').length;
  for (let i = 0; i < thumbCount; i++) {
    const $thumbWrapper = $('.gallery-carousel .owl-item').eq(i).find('.thumb-wrapper');
    $thumbWrapper.find('.overlay-container').empty();
  }

  // 🔹 3. Limpiar overlays en el preview principal
  const overlayMainContainer = document.getElementById('overlayMainContainer');
  if (overlayMainContainer) overlayMainContainer.innerHTML = '';

  // 🔹 4. Reaplicar selecciones en todos los grupos de opciones
  document.querySelectorAll('.row.g-3[id^="opciones-"]').forEach(row => {
    const rowId = row.id;

    // Omitir grupos especiales
    if (rowId === 'opciones-casas' || rowId === 'opciones-fachada' || rowId === 'opciones-habitaciones') return;

    // Ver si ya hay opción seleccionada
    let option = row.querySelector('.option-card.selected');

    // Si no hay, seleccionar la primera opción del grupo
    if (!option) {
      option = row.querySelector('.option-card');
      if (option) {
        row.querySelectorAll('.option-card').forEach(c => c.classList.remove('selected'));
        option.classList.add('selected');
      }
    }

    // Reaplicar la lógica/renderizado de la opción actual
    if (option) {
      try {
        seleccionarOpcion(option);
      } catch (e) {
        console.error('Error al reaplicar opción para', rowId, e);
      }
    }
  });

  // 🔹 5. Actualizar visuales en miniaturas y preview principal
  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx));
  updateMainPreview(globalindex);
}
