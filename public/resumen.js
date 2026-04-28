// =======================
// VARIABLES INICIALES
// =======================
const savedSelections = JSON.parse(localStorage.getItem('selections')) || {};
const miniaturasData = JSON.parse(localStorage.getItem('miniaturasData') || '[]');
let currentGalleryIndex = 0;
const lightbox = document.getElementById('galleryLightbox');
const galleryRender = document.getElementById('galleryRender');

function quitarAcentos(texto = '') {
  return texto
    .toString()
    .normalize('NFD')
    .replace(/[\u0300-\u036f]/g, '');
}

function normalizarEstilo(valor = '') {
  const limpio = quitarAcentos(valor).toLowerCase().trim();

  if (limpio.includes('minimalista')) return 'minimalista';
  if (limpio.includes('tulum')) return 'tulum';
  if (limpio.includes('mexican')) return 'mexicana';

  return null;
}

function normalizarFachada(valor = '') {
  const limpio = quitarAcentos(valor).toLowerCase().trim();
  const match = limpio.match(/([ab])\s*$/i);
  return match ? match[1].toLowerCase() : null;
}

function obtenerNumeroRecamaras(valor = '') {
  const match = valor.toString().match(/\d+/);
  return match ? Number(match[0]) : null;
}

function obtenerConstruccionM2(estilo, fachada, recamaras) {
  const estiloKey = normalizarEstilo(estilo);
  const fachadaKey = normalizarFachada(fachada);
  const recamarasKey = obtenerNumeroRecamaras(recamaras);
  const tabla = typeof tablaConstruccionM2 !== 'undefined' ? tablaConstruccionM2 : {};

  if (!estiloKey || !fachadaKey || !recamarasKey) return null;

  const valor = tabla[estiloKey]?.[fachadaKey]?.[recamarasKey];
  return typeof valor === 'number' ? valor : null;
}

function formatearM2(valor) {
  return Number(valor).toLocaleString('es-MX', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });
}

const AHAWELL_CHILD_DEVELOPMENTS = ['portal', 'chakte', 'bayal', 'pakal', 'chechem'];

function obtenerNombreLote(lote) {
  if (!lote || typeof lote !== 'object') return '';
  if (lote.lot_name) return lote.lot_name;

  const nombreCrudo = String(lote.name ?? lote.valor ?? '').trim();
  if (!nombreCrudo) return '';

  const match = nombreCrudo.match(/lote\s+(.+)$/i);
  return match ? match[1].trim() : nombreCrudo;
}

function normalizarNombreDesarrollo(nombre = '') {
  const valor = String(nombre || '').trim();
  if (!valor) return '';

  const nombreLimpio = quitarAcentos(valor).toLowerCase().trim();
  if (nombreLimpio.startsWith('ahawell')) return valor;
  if (AHAWELL_CHILD_DEVELOPMENTS.includes(nombreLimpio)) {
    return `Ahawell - ${valor}`;
  }

  return valor;
}

function obtenerDesarrolloDesdeLote(lote) {
  if (!lote || typeof lote !== 'object') return 'N/D';

  const desarrolloDirecto = normalizarNombreDesarrollo(
    lote.development_display_name || lote.development_name || ''
  );
  if (desarrolloDirecto) return desarrolloDirecto;

  const origenNombre = String(lote.name ?? lote.valor ?? '').trim();
  const match = origenNombre.match(/^(.*?)\s*-\s*lote\b/i);
  if (match?.[1]) {
    const desarrolloDesdeNombre = normalizarNombreDesarrollo(match[1]);
    if (desarrolloDesdeNombre) return desarrolloDesdeNombre;
  }

  return 'N/D';
}

function normalizarCategoria(valor = '') {
  return quitarAcentos(String(valor || '')).toLowerCase().trim();
}

function esCategoriaFachada(item) {
  const categoria = normalizarCategoria(item?.categoria || '');
  const valor = normalizarCategoria(item?.valor || '');
  return categoria.includes('fachada') || valor.includes('fachada');
}

function esCategoriaEstilo(item) {
  return normalizarCategoria(item?.categoria || '') === 'estilo';
}

function precioNumerico(valor) {
  const parsed = Number(valor);
  return Number.isFinite(parsed) ? parsed : 0;
}

function obtenerPrecioRenglon(key, item, precioFachadaBase) {
  if (!item || typeof item !== 'object') return 0;

  if (key === 'lote' || normalizarCategoria(item.categoria) === 'lote') {
    return item.suma === true ? precioNumerico(item.total ?? item.precio) : 0;
  }

  if (esCategoriaFachada(item)) {
    return precioNumerico(precioFachadaBase);
  }

  return precioNumerico(item.precio);
}

function debeMostrarEnTabla(key, item) {
  if (!item || typeof item !== 'object') return false;
  if (key === 'zona' || key === 'development') return false;
  if (key === 'opciones-zonas' || normalizarCategoria(item.categoria) === 'zona') return false;

  if (key === 'lote') return true;

  return Boolean((item.categoria && item.categoria.trim() !== '') || (item.valor && item.valor.trim() !== ''));
}

// =======================
// TABLA RESUMEN
// =======================
const tbody = document.querySelector('#tablaResumen tbody');
tbody.innerHTML = '';

const entries = Object.entries(savedSelections);
const estiloEntry = entries.find(([_, item]) => esCategoriaEstilo(item));
const otherEntries = entries.filter(([_, item]) => !esCategoriaEstilo(item));

const orderedEntries = estiloEntry ? [estiloEntry, ...otherEntries] : otherEntries;
const tableEntries = orderedEntries.filter(([key, item]) => debeMostrarEnTabla(key, item));
const facadeBasePrice = precioNumerico(savedSelections["precio_base_fachada"] ?? savedSelections["opciones-fachada"]?.precio);

let totalResumenCasa = 0;
tableEntries.forEach(([key, item]) => {
  if (key === 'lote' || normalizarCategoria(item.categoria) === 'lote') return;
  if (esCategoriaFachada(item)) return;
  totalResumenCasa += precioNumerico(item.precio);
});
totalResumenCasa += facadeBasePrice;

const loteEntry = savedSelections["lote"] || null;
const loteTotalResumen = loteEntry && loteEntry.suma === true ? precioNumerico(loteEntry.total) : 0;
const totalResumen = totalResumenCasa + loteTotalResumen;

tableEntries.forEach(([key, item]) => {
  const categoriaLabel = item.categoria || (key === 'lote' ? 'Lote' : '');
  const valorLabel = item.valor || item.name || '';

  const headingId = '#' + key.replace('collapse-', 'heading-');
  const seccion = secciones.find(s => s.id === headingId);
  const carouselIndex = seccion ? seccion.carouselIndex : null;

  let renderHTML = '';

  if (carouselIndex !== null && miniaturasData[carouselIndex]) {
    const mini = miniaturasData[carouselIndex];

    renderHTML = `
      <div style="position:relative; width:100px;">
        <img src="${mini.base}" class="img-fluid rounded" style="width:100%;">
        ${mini.overlays.map(src => `
          <img src="${src}" style="position:absolute; top:0; left:0; width:100%; height:100%; pointer-events:none;">
        `).join('')}
      </div>
    `;
  }

  const precioFinal = obtenerPrecioRenglon(key, item, facadeBasePrice);

  const row = `
  <tr>
    <td>${categoriaLabel}</td>
    <td>${valorLabel}</td>
    <td>
      ${item.pre_code ? 'Pre: ' + item.pre_code + '<br>' : ''}
      ${item.variant_code ? 'Var: ' + item.variant_code : ''}
    </td>
    <td class="text-nowrap">${renderHTML}</td>
    <td>
      ${precioFinal === 0
      ? ''
      : '$' + precioFinal.toLocaleString('es-MX')
    }
    </td>
  </tr>
`;
  tbody.insertAdjacentHTML('beforeend', row);
});

// =======================
// TOTAL RESUMEN
// =======================
const totalElemento = document.querySelector('#totalResumen');
if (totalElemento) {
  totalElemento.textContent = "$" + totalResumen.toLocaleString("es-MX");
}

// Total duplicado arriba


if (loteEntry) {
  const lotePrecio = document.getElementById('lotePrecio');
  const loteResumen = document.getElementById('loteResumen');
  const desarrolloResumen = document.getElementById('desarrolloResumen');
  const desarrolloNombre = document.getElementById('desarrolloNombre');
  const loteAreaResumen = document.getElementById('loteAreaResumen');
  const loteArea = document.getElementById('loteArea');

  if (lotePrecio && loteResumen) {
    loteResumen.classList.remove('d-none');

    // Siempre mostrar nombre del lote
    const nombreLote = obtenerNombreLote(loteEntry);
    let texto = `Lote ${nombreLote || loteEntry.name || ''}`;

    // Solo mostrar precio si suma === true
    if (loteEntry.suma) {
      texto += ` · $${loteEntry.total.toLocaleString('es-MX')}`;
    }

    lotePrecio.textContent = texto;
  }

  if (desarrolloResumen && desarrolloNombre) {
    desarrolloResumen.classList.remove('d-none');
    desarrolloNombre.textContent = obtenerDesarrolloDesdeLote(loteEntry);
  }

  if (loteArea && loteAreaResumen) {
    loteAreaResumen.classList.remove('d-none');
    loteArea.textContent =
      loteEntry.area !== undefined && loteEntry.area !== null && loteEntry.area !== ''
        ? `${loteEntry.area} m²`
        : 'N/D';
  }
}


const precioCasa = totalResumenCasa;

const precioCasaEl = document.getElementById('precioCasa');
if (precioCasaEl) {
  precioCasaEl.textContent = '$' + precioCasa.toLocaleString('es-MX');
}
const totalTop = document.querySelector('#totalResumenTop');
if (totalTop) {
  totalTop.textContent = "$" + totalResumen.toLocaleString("es-MX");
}
// =======================
// ACTUALIZACIÓN DE UI
// =======================
const recamarasSeleccionadas = savedSelections.Habitaciones?.valor || '';
if (savedSelections.Habitaciones) {
  document.querySelector('.texto-fondo').textContent = recamarasSeleccionadas;
  document.querySelector('#recamarastabla').textContent = recamarasSeleccionadas;
}

const fachadaEntry = Object.values(savedSelections).find(item => esCategoriaFachada(item));
const fachadaSeleccionada = fachadaEntry?.valor || '';
if (fachadaEntry) {
  document.querySelector('#fachadatabla').textContent = fachadaSeleccionada;
}

const estiloSeleccionado =
  savedSelections["opciones-casas"]?.valor ||
  estiloEntry?.[1]?.valor ||
  '';

if (estiloSeleccionado) {
  document.querySelector('#estilotabla').textContent = estiloSeleccionado;
}

const construccionM2 = obtenerConstruccionM2(
  estiloSeleccionado,
  fachadaSeleccionada,
  recamarasSeleccionadas
);
const construccionTabla = document.querySelector('#construcciontabla');
if (construccionTabla) {
  construccionTabla.textContent = construccionM2 !== null
    ? `${formatearM2(construccionM2)} m²`
    : 'N/D';
}

if (normalizarCategoria(fachadaSeleccionada).endsWith('b')) {
  document.querySelector('.imagen-casa').src = "/img/resumen-b.png";
} else {
  document.querySelector('.imagen-casa').src = "/img/resumen.png";
}

// =======================
// IMAGEN SEGÚN RECÁMARAS + FACHADA
// =======================
if (savedSelections.Habitaciones) {
  const recamarasTexto = savedSelections.Habitaciones.valor;

  // Obtener número de recámaras (1,2,3,4)
  const match = recamarasTexto.match(/\d+/);

  if (match) {
    const recamaras = match[0];

    // Obtener fachada (A o B)
    const fachadaEntry = Object.values(savedSelections)
      .find(item => esCategoriaFachada(item));

    const fachada = fachadaEntry && /b/i.test(fachadaEntry.valor) ? 'B' : 'A';

    // Construir ruta final
    const imgSrc = `/assets/plantas/${recamaras}${fachada}.jpg`;

    const imgRec = document.querySelector('.imagen-recamaras');
    if (imgRec) imgRec.src = imgSrc;
  }
}

// =======================
// GUARDAR CONFIGURACIÓN
// =======================
async function saveConfiguration() {
  try {
    const token = document.querySelector('meta[name="csrf-token"]')?.content;

    const selectionsToSave = Object.fromEntries(
      Object.entries(savedSelections).filter(([_, v]) => v && typeof v === 'object')
    );

    // ==========================
    // AJUSTE SOLO PARA LOTE
    // ==========================
    let precioFinal = totalResumen;

    if (selectionsToSave.lote) {
      selectionsToSave.lote = {
        ...selectionsToSave.lote,
        categoria: "Lote",
        valor: selectionsToSave.lote.name,
        precio: selectionsToSave.lote.suma === true ? selectionsToSave.lote.total : 0
      };

      if (selectionsToSave.lote.suma === true) {
        precioFinal += selectionsToSave.lote.total;
      }
    }

    const dataToSave = {
      configuration: selectionsToSave,
      miniaturasData,
      precioTotal: precioFinal,
      fecha: new Date().toISOString(),
    };

    const response = await fetch('/house-configurations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        ...(token ? { 'X-CSRF-TOKEN': token } : {}),
        'Accept': 'application/json'
      },
      credentials: 'include',
      body: JSON.stringify(dataToSave)
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({ message: response.statusText }));
      throw new Error(errorData.message || 'Error desconocido al guardar');
    }

    Swal.fire({
      icon: 'success',
      title: 'Guardado',
      text: 'Configuración guardada con éxito, encontrarás tus configuraciones guardadas en tu perfil',
      showConfirmButton: false,
      timer: 3500,
      timerProgressBar: true
    });

  } catch (error) {
    console.error('saveConfiguration error:', error);

    Swal.fire({
      icon: 'error',
      title: 'Error',
      text: error.message || 'Error al guardar la configuración',
      confirmButtonText: 'Aceptar'
    });
  }
}


// =======================
// MINIATURAS
// =======================
const container = document.querySelector('#miniaturasResumen');
container.innerHTML = '';

miniaturasData.forEach((item, index) => {
  const wrapper = document.createElement('div');
  wrapper.className = 'thumb-wrapper';
  wrapper.style.position = 'relative';

  const imgBase = document.createElement('img');
  imgBase.src = item.base;
  imgBase.className = 'thumb';
  wrapper.appendChild(imgBase);

  if (item.overlays.length) {
    item.overlays.forEach(src => {
      const overlay = document.createElement('img');
      overlay.src = src;
      overlay.style.position = 'absolute';
      overlay.style.top = 0;
      overlay.style.left = 0;
      overlay.style.width = '100%';
      overlay.style.height = '100%';
      overlay.style.pointerEvents = 'none';
      wrapper.appendChild(overlay);
    });
  }

  // 🔥 CLICK CORRECTO
  wrapper.addEventListener('click', () => {
    currentGalleryIndex = index;
    lightbox.classList.remove('d-none');
    renderGalleryItem(currentGalleryIndex);
  });

  container.appendChild(wrapper);
});

// =======================
// RENDER PRINCIPAL
// =======================
const principalRender = document.querySelector('#principalRender');

if (miniaturasData.length > 1) {
  const item = miniaturasData[1];

  const wrapper = document.createElement('div');
  wrapper.style.position = 'relative';

  const imgBase = document.createElement('img');
  imgBase.src = item.base;
  imgBase.className = 'thumb tumb-original img-fluid rounded';
  wrapper.appendChild(imgBase);

  if (item.overlays.length > 0) {
    const overlayDiv = document.createElement('div');
    overlayDiv.className = 'overlay-container';
    overlayDiv.style.position = 'absolute';
    overlayDiv.style.top = '0';
    overlayDiv.style.left = '0';
    overlayDiv.style.width = '100%';
    overlayDiv.style.height = '100%';
    overlayDiv.style.pointerEvents = 'none';

    item.overlays.forEach(src => {
      const imgOverlay = document.createElement('img');
      imgOverlay.src = src;
      imgOverlay.style.width = '100%';
      imgOverlay.style.height = '100%';
      imgOverlay.style.position = 'absolute';
      overlayDiv.appendChild(imgOverlay);

      wrapper.addEventListener('click', () => {
        currentGalleryIndex = miniaturasData.indexOf(item);
        lightbox.classList.remove('d-none');
        renderGalleryItem(currentGalleryIndex);
      });
    });

    wrapper.appendChild(overlayDiv);
  }

  principalRender.appendChild(wrapper);
}


document.querySelector('.gallery-close').onclick = () => {
  lightbox.classList.add('d-none');
};

document.querySelector('.gallery-nav.next').onclick = () => {
  currentGalleryIndex =
    (currentGalleryIndex + 1) % miniaturasData.length;
  renderGalleryItem(currentGalleryIndex);
};

document.querySelector('.gallery-nav.prev').onclick = () => {
  currentGalleryIndex =
    (currentGalleryIndex - 1 + miniaturasData.length) % miniaturasData.length;
  renderGalleryItem(currentGalleryIndex);
};


function renderGalleryItem(index) {
  const item = miniaturasData[index];
  if (!item) return;

  galleryRender.innerHTML = '';

  const wrapper = document.createElement('div');
  wrapper.style.position = 'relative';

  const base = document.createElement('img');
  base.src = item.base;
  wrapper.appendChild(base);

  item.overlays.forEach(src => {
    const overlay = document.createElement('img');
    overlay.src = src;
    overlay.style.position = 'absolute';
    overlay.style.top = '0';
    overlay.style.left = '0';
    overlay.style.width = '100%';
    overlay.style.height = '100%';
    wrapper.appendChild(overlay);
  });

  galleryRender.appendChild(wrapper);
}


document.querySelector('.apartado-row button').addEventListener('click', () => {
  const loteNormalizado = normalizarLote(savedSelections.lote);
  savedSelections.lote = loteNormalizado;
  window.leadContext = {
    source: 'configurador',
    configuration: savedSelections,
    miniaturas: miniaturasData,
    total: totalResumen,
    lote: savedSelections.lote ?? null
  };

});


function normalizarLote(lote) {
  if (!lote || typeof lote !== 'object') return null;

  const developmentDisplayName = obtenerDesarrolloDesdeLote(lote);

  return {
    id: lote.id ?? null,
    name : lote.name ?? null,
    lot_name: lote.lot_name ?? obtenerNombreLote(lote) ?? null,
    categoria: 'Lote',
    valor: lote.name ?? lote.valor ?? '',
    precio: lote.suma === true ? Number(lote.total || 0) : 0,
    origen: lote.origen ?? null,
    suma: Boolean(lote.suma),
    total: Number(lote.total || 0),
    area: lote.area ?? null,
    price_square_meter: lote.price_square_meter ?? null,
    development_id: lote.development_id ?? null,
    development_name: lote.development_name ?? null,
    development_display_name: developmentDisplayName !== 'N/D'
      ? developmentDisplayName
      : (lote.development_display_name ?? null)
  };
}
