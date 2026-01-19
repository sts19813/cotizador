// =======================
// VARIABLES INICIALES
// =======================
const savedSelections = JSON.parse(localStorage.getItem('selections')) || {};
const miniaturasData = JSON.parse(localStorage.getItem('miniaturasData') || '[]');
let currentGalleryIndex = 0;
const lightbox = document.getElementById('galleryLightbox');
const galleryRender = document.getElementById('galleryRender');

// =======================
// TABLA RESUMEN
// =======================
const tbody = document.querySelector('#tablaResumen tbody');
tbody.innerHTML = '';

const entries = Object.entries(savedSelections);
const estiloEntry = entries.find(([_, item]) => item.categoria === "Estilo");
const otherEntries = entries.filter(([_, item]) => item.categoria !== "Estilo");

const orderedEntries = estiloEntry ? [estiloEntry, ...otherEntries] : otherEntries;

orderedEntries.forEach(([key, item]) => {
  if (!item.categoria || item.categoria.trim() === '') return;

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

  const precioFinal = getPrecioCorrecto(item);

  const row = `
  <tr>
    <td>${item.categoria ?? ''}</td>
    <td>${item.valor ?? ''}</td>
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
let totalResumen = 0;
orderedEntries.forEach(([_, item]) => totalResumen += getPrecioCorrecto(item));

const totalElemento = document.querySelector('#totalResumen');
if (totalElemento) {
  totalElemento.textContent = "$" + totalResumen.toLocaleString("es-MX");
}

// Total duplicado arriba


const loteEntry = savedSelections["lote"];

if (loteEntry) {
  const lotePrecio = document.getElementById('lotePrecio');
  const loteResumen = document.getElementById('loteResumen');

  if (lotePrecio && loteResumen) {
    loteResumen.classList.remove('d-none');

    // Siempre mostrar nombre del lote
    let texto = `Lote ${loteEntry.name}`;

    // Solo mostrar precio si suma === true
    if (loteEntry.suma) {
      texto += ` · $${loteEntry.total.toLocaleString('es-MX')}`;
    }

    lotePrecio.textContent = texto;
  }
}


debugger
const precioCasa = totalResumen;

const precioCasaEl = document.getElementById('precioCasa');
if (precioCasaEl) {
  precioCasaEl.textContent = '$' + precioCasa.toLocaleString('es-MX');
}
const totalTop = document.querySelector('#totalResumenTop');
if (totalTop) {
  totalTop.textContent = "$" + (totalResumen + (savedSelections.lote?.suma ? savedSelections.lote.total : 0)).toLocaleString("es-MX");
}
// =======================
// ACTUALIZACIÓN DE UI
// =======================
if (savedSelections.Habitaciones) {
  document.querySelector('.texto-fondo').textContent = savedSelections.Habitaciones.valor;
  document.querySelector('#recamarastabla').textContent = savedSelections.Habitaciones.valor;
}

const fachadaEntry = Object.values(savedSelections).find(item => item.categoria === "Fachada");
if (fachadaEntry) {
  document.querySelector('#fachadatabla').textContent = fachadaEntry.valor;
}

if (savedSelections["opciones-casas"]) {
  document.querySelector('#estilotabla').textContent = savedSelections["opciones-casas"].valor;
}

if (savedSelections["collapse-21"]?.valor === "Fachada B") {
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
      .find(item => item.categoria === "Fachada");

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


// =======================
// FUNCIONES DE PRECIOS
// =======================
function getClavePrecioFachada() {
  const fachadaEntry = Object.values(savedSelections)
    .find(item => item.categoria === "Fachada");

  if (!fachadaEntry) return null;

  let sufijo = fachadaEntry.valor.replace(/fachada/i, "").trim().toLowerCase();

  return "precio_" + sufijo;
}

function getPrecioCorrecto(producto) {
  if (!producto || typeof producto !== "object") return 0;

  const clave = getClavePrecioFachada();

  if (clave && producto[clave] !== undefined) {
    const val = parseFloat(producto[clave]);
    return isNaN(val) ? 0 : val;
  }

  if (producto.precio_a) return parseFloat(producto.precio_a) || 0;
  if (producto.precio_b) return parseFloat(producto.precio_b) || 0;

  return parseFloat(producto.precio) || 0;
}


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

  return {
    id: lote.id ?? null,
    name : lote.name ?? null,
    categoria: 'Lote',
    valor: lote.name ?? lote.valor ?? '',
    precio: lote.suma === true ? Number(lote.total || 0) : 0,
    origen: lote.origen ?? null,
    suma: Boolean(lote.suma),
    total: Number(lote.total || 0),
    area: lote.area ?? null,
    price_square_meter: lote.price_square_meter ?? null
  };
}
