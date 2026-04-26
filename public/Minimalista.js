/**********************************************************
 * VARIABLES GLOBALES
 **********************************************************/
let selections = {};
let globalindex = 0;
let activeOverlays = {};
let selectedFachada = null;
let currentLoadToken = 0; // Loader helpers y token global
const OVERLAY_TRANSITION_MS = 1500;
let isBootstrappingSelections = true;
let lastOptionClickMeta = { trusted: false, ts: 0 };

const PREVENTA_DEVELOPMENT_IDS = new Set([43, 3, 2, 14, 8, 9, 10]);
const DEFAULT_MAIN_DEVELOPMENT_ID = 33;
const MAIN_DEVELOPMENT_NAME_MAP = {
  33: 'Piaró',
  43: 'Paseo Península',
  3: 'Ahawell'
};
const DEVELOPMENT_ROOT_MAP = {
  33: 33,
  43: 43,
  3: 3,
  2: 3,
  14: 3,
  8: 3,
  9: 3,
  10: 3
};

function normalizeFachadaSuffix(value = '') {
  if (!value) return null;
  return String(value)
    .replace(/fachada/i, '')
    .trim()
    .toLowerCase();
}

function resolveMainDevelopmentId(developmentId) {
  const numericId = Number(developmentId);
  if (!numericId || Number.isNaN(numericId)) return null;
  return DEVELOPMENT_ROOT_MAP[numericId] || numericId;
}

function getMainDevelopmentLabel(developmentId) {
  const rootId = resolveMainDevelopmentId(developmentId);
  return MAIN_DEVELOPMENT_NAME_MAP[rootId] || 'Desarrollo';
}

function hasSelectedLotForPricing() {
  const lotDevelopmentId =
    selections?.lote?.development_id ??
    selections?.lote?.desarrollo_id ??
    null;

  return Boolean(resolveMainDevelopmentId(lotDevelopmentId));
}

function getSelectedDevelopmentRootId() {
  if (hasSelectedLotForPricing()) {
    const lotRoot = resolveMainDevelopmentId(
      selections?.lote?.development_id ??
      selections?.lote?.desarrollo_id
    );
    if (lotRoot) return lotRoot;
  }

  return DEFAULT_MAIN_DEVELOPMENT_ID;
}

function setSelectedDevelopmentForPricing(developmentId, options = {}) {
  const { recalculate = true, persist = true } = options;
  const rootId = resolveMainDevelopmentId(developmentId) || DEFAULT_MAIN_DEVELOPMENT_ID;

  if (!selections || typeof selections !== 'object') {
    selections = {};
  }

  selections.development = {
    id: rootId,
    root_id: rootId,
    name: getMainDevelopmentLabel(rootId)
  };

  if (persist) {
    localStorage.setItem('selections', JSON.stringify(selections));
  }

  applyPricesForCurrentContext({ recalculate });
  return rootId;
}

function getCurrentFacadeSuffix() {
  const fromSelected = normalizeFachadaSuffix(selectedFachada);
  if (fromSelected) return fromSelected;

  const fromSelection = normalizeFachadaSuffix(selections?.['opciones-fachada']?.valor);
  if (fromSelection) return fromSelection;

  return '4a';
}

function getDevelopmentSpecificPrice(card, developmentRootId, priceKey) {
  if (!card || !priceKey) return null;

  let parsedMap = {};
  try {
    parsedMap = JSON.parse(card.dataset.developmentPrices || '{}');
  } catch (_error) {
    parsedMap = {};
  }

  const developmentNode = parsedMap[String(developmentRootId)];
  if (!developmentNode || developmentNode[priceKey] === undefined || developmentNode[priceKey] === null) {
    return null;
  }

  const value = parseFloat(developmentNode[priceKey]);
  return Number.isNaN(value) ? null : value;
}

function getDevelopmentSpecificBasePrice(card, developmentRootId) {
  debugger;
  if (!card) return null;

  let parsedMap = {};
  try {
    parsedMap = JSON.parse(card.dataset.developmentPrices || '{}');
  } catch (_error) {
    parsedMap = {};
  }

  const developmentNode = parsedMap[String(developmentRootId)];
  if (!developmentNode || developmentNode.base_price === undefined || developmentNode.base_price === null) {
    return null;
  }

  const value = parseFloat(developmentNode.base_price);
  return Number.isNaN(value) ? null : value;
}

function getPriceByContextForCard(card, options = {}) {
  if (!card) return 0;

  const developmentRootId = resolveMainDevelopmentId(
    options.developmentRootId ?? getSelectedDevelopmentRootId()
  ) || DEFAULT_MAIN_DEVELOPMENT_ID;
  const facadeSuffix = normalizeFachadaSuffix(options.facadeSuffix ?? getCurrentFacadeSuffix());
  const priceKey = facadeSuffix ? `precio_${facadeSuffix}` : null;
  const useDevelopmentOverride = options.useDevelopmentOverride ?? hasSelectedLotForPricing();
  const isFacadeCard = String(card.dataset.categoria || '').toLowerCase() === 'fachada';

  if (isFacadeCard && useDevelopmentOverride) {
    const developmentBasePrice = getDevelopmentSpecificBasePrice(card, developmentRootId);
    if (developmentBasePrice !== null) return developmentBasePrice;
  }

  if (priceKey && useDevelopmentOverride) {
    const developmentPrice = getDevelopmentSpecificPrice(card, developmentRootId, priceKey);
    if (developmentPrice !== null) return developmentPrice;
  }

  if (priceKey && !isFacadeCard) {
    if (card.dataset[priceKey] !== undefined) {
      const value = parseFloat(card.dataset[priceKey]);
      if (!Number.isNaN(value)) return value;
    }
  }

  const fallback = parseFloat(card.dataset.precio);
  return Number.isNaN(fallback) ? 0 : fallback;
}

function applyPricesForCurrentContext(options = {}) {
  const { recalculate = true } = options;
  const developmentRootId = getSelectedDevelopmentRootId();
  const facadeSuffix = getCurrentFacadeSuffix();

  document.querySelectorAll('.option-card[data-precio_a]').forEach(card => {
    const newPrice = getPriceByContextForCard(card, { developmentRootId, facadeSuffix });
    card.dataset.precio = Number.isFinite(newPrice) ? String(newPrice) : '0';

    const priceLabel = card.querySelector('.precio-producto');
    if (priceLabel) {
      if (newPrice === 0) {
        priceLabel.textContent = '';
      } else {
        priceLabel.textContent = formatoMXN(newPrice);
        priceLabel.classList.remove('incluido');
      }
    }

    if (card.classList.contains('selected')) {
      const group = card.closest('.accordion-collapse');
      const groupId = group?.id || 'sin-id';
      if (selections[groupId]) {
        selections[groupId].precio = newPrice;
      }
    }
  });

  if (selections['opciones-fachada']) {
    const selectedFacadeCard = document.querySelector(
      `.option-card[data-categoria="Fachada"][data-valor="${selections['opciones-fachada'].valor}"]`
    );
    if (selectedFacadeCard) {
      const facadePrice = getPriceByContextForCard(selectedFacadeCard, { developmentRootId, facadeSuffix });
      selections['precio_base_fachada'] = facadePrice;
      selections['opciones-fachada'].precio = facadePrice;
    }
  }

  localStorage.setItem('selections', JSON.stringify(selections));

  if (recalculate) {
    recalcularPrecioTotal();
  }
}

window.resolveMainDevelopmentId = resolveMainDevelopmentId;
window.setSelectedDevelopmentForPricing = setSelectedDevelopmentForPricing;
window.applyPricesForCurrentContext = applyPricesForCurrentContext;

document.addEventListener('click', function (e) {
  if (e.target && e.target.closest('.option-card')) {
    lastOptionClickMeta = { trusted: !!e.isTrusted, ts: Date.now() };
  }
}, true);

function shouldAnimateSelectionOverlay() {
  const freshInteraction = (Date.now() - lastOptionClickMeta.ts) < 500;
  return !isBootstrappingSelections && lastOptionClickMeta.trusted && freshInteraction;
}

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
    const sameKeyNodes = Array.from(container.querySelectorAll(`[data-overlay-key="${escapeSelectorValue(item.key)}"]`));
    const current = sameKeyNodes[sameKeyNodes.length - 1] || null;
    if (sameKeyNodes.length > 1) {
      sameKeyNodes.slice(0, -1).forEach(n => n.remove());
    }
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
        const preload = new window.Image();
        preload.onload = preload.onerror = () => {
          requestAnimationFrame(() => {
            img.style.opacity = '1';
          });
        };
        preload.src = item.url;
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

    // Crossfade real: imagen anterior -> imagen nueva.
    const next = current.cloneNode(false);
    next.src = item.url;
    next.dataset.overlayUrl = item.url;
    next.style.opacity = '0';
    next.style.transition = `opacity ${OVERLAY_TRANSITION_MS}ms ease`;
    next.style.zIndex = current.style.zIndex;
    container.appendChild(next);

    const startFade = () => {
      requestAnimationFrame(() => {
        current.style.transition = `opacity ${OVERLAY_TRANSITION_MS}ms ease`;
        current.style.opacity = '0';
        next.style.opacity = '1';
      });
    };

    const preload = new window.Image();
    preload.onload = startFade;
    preload.onerror = startFade;
    preload.src = item.url;

    const cleanup = () => {
      if (current.parentNode) current.remove();
      next.removeEventListener('transitionend', cleanup);
    };
    next.addEventListener('transitionend', cleanup);
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
  const developmentId = Number(hasSelectedLotForPricing()
    ? (selections?.lote?.development_id ?? selections?.lote?.desarrollo_id ?? DEFAULT_MAIN_DEVELOPMENT_ID)
    : DEFAULT_MAIN_DEVELOPMENT_ID);

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
  const animateSelection = shouldAnimateSelectionOverlay();
  const categoria = elemento.getAttribute('data-categoria');
  const valor = elemento.getAttribute('data-valor');

  // ===== Fachada =====
  if (categoria === 'Fachada') {
    selectedFachada = valor;

    const precioBase = getPriceByContextForCard(elemento, {
      facadeSuffix: normalizeFachadaSuffix(valor)
    });
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
      updateThumbnailOverlay(idx, { animate: false });
    });
    const overlayMainContainer = document.getElementById('overlayMainContainer');
    if (overlayMainContainer) overlayMainContainer.innerHTML = '';

    // EN LUGAR de autoSelectFirstOptions(); ... -> llamamos a la nueva función que reaplica todo
    refreshSelectionsAndOverlays();
    applyPricesForCurrentContext({ recalculate: true });

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

  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx, { animate: animateSelection }));
  updateMainPreview(globalindex, { animate: animateSelection });
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
  const initialDevelopmentId =
    selections?.lote?.development_id ??
    DEFAULT_MAIN_DEVELOPMENT_ID;
  setSelectedDevelopmentForPricing(initialDevelopmentId, {
    recalculate: false,
    persist: true
  });

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
  let parts = window.location.pathname.split("/").filter(Boolean);
  let slug = parts[0] || "home";

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
  setTimeout(() => {
    isBootstrappingSelections = false;
  }, 1200);
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
  const animateSelection = shouldAnimateSelectionOverlay();
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
  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx, { animate: animateSelection }));
  updateMainPreview(globalindex, { animate: animateSelection });
}
