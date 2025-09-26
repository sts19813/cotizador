// =======================
// Variables iniciales
// =======================
const savedSelections = JSON.parse(localStorage.getItem('selections')) || {};
const miniaturasData = JSON.parse(localStorage.getItem('miniaturasData') || '[]');

// =======================
// Construcción de tabla resumen con renders superpuestos
// =======================
const tbody = document.querySelector('#tablaResumen tbody');
tbody.innerHTML = '';

// Convertir a array y separar "Estilo" del resto
const entries = Object.entries(savedSelections);
const estiloEntry = entries.find(([key, item]) => item.categoria === "Estilo");
const otherEntries = entries.filter(([key, item]) => item.categoria !== "Estilo");

// Orden final: primero Estilo, luego el resto
const orderedEntries = estiloEntry ? [estiloEntry, ...otherEntries] : otherEntries;

orderedEntries.forEach(([key, item], index) => {
  // Normalizar: collapse-XX → #heading-XX
  const headingId = '#' + key.replace('collapse-', 'heading-');

  // Buscar en "secciones" el índice de carrusel correspondiente al ID (si existe)
  const seccion = secciones.find(s => s.id === headingId);
  const carouselIndex = seccion ? seccion.carouselIndex : null;

  let renderHTML = '';

  if (carouselIndex !== null && miniaturasData[carouselIndex]) {
    const mini = miniaturasData[carouselIndex];

    // Construir wrapper con base + overlays
    renderHTML = `
      <div style="position:relative; width:100px; height:auto;">
        <img src="${mini.base}" class="img-fluid rounded" style="width:100%; display:block;">
        ${mini.overlays.map(src => `
          <img src="${src}" style="position:absolute; top:0; left:0; width:100%; height:100%; pointer-events:none;">
        `).join('')}
      </div>
    `;
  }

  const row = `
    <tr>
      <td>${item.categoria ?? ''}</td>
      <td>${item.valor ?? ''}</td>
      <td>
        ${item.pre_code ? 'Pre: ' + item.pre_code + '<br>' : ''}
        ${item.variant_code ? 'Var: ' + item.variant_code : ''}
      </td>
      <td class="text-nowrap">${renderHTML}</td>
    </tr>
  `;
  tbody.insertAdjacentHTML('beforeend', row);
});

// =======================
// Actualización de elementos de UI
// =======================
document.querySelector('.texto-fondo').textContent = savedSelections.Habitaciones.valor;
document.querySelector('#recamarastabla').textContent = savedSelections.Habitaciones.valor;
const fachadaEntry = Object.values(savedSelections).find(item => item.categoria === "Fachada");

// Si existe, actualizar el texto
if (fachadaEntry) {
  document.querySelector('#fachadatabla').textContent = fachadaEntry.valor;
}

document.querySelector('#estilotabla').textContent = savedSelections["opciones-casas"].valor;

if (savedSelections["collapse-21"]?.valor === "Fachada B") {
  document.querySelector('.imagen-casa').src = "/img/resumen-b.png";
} else {
  document.querySelector('.imagen-casa').src = "/img/resumen.png";
}

const recamaras = savedSelections.Habitaciones.valor;
let imgSrc = "/img/1.png";
if (recamaras === "2 Recámaras") imgSrc = "/img/2.png";
else if (recamaras === "3 Recámaras") imgSrc = "/img/3.png";
else if (recamaras === "4 Recámaras") imgSrc = "/img/4.png";
document.querySelector('img[alt=""][src^="/img/"][width="400px"]').src = imgSrc;

// =======================
// Funciones
// =======================
///método que guarda la configuracion en base de datos de la seleccion y configuracion de la casa
async function saveConfiguration() {
  try {
    const tokenMeta = document.querySelector('meta[name="csrf-token"]');
    const token = tokenMeta ? tokenMeta.getAttribute('content') : null;

    const selectionsToSave = Object.fromEntries(
      Object.entries(savedSelections).filter(([k, v]) => v && typeof v === 'object')
    );

    const totalPrice = Object.values(selectionsToSave).reduce((sum, sel) => {
      const raw = sel.precio ?? sel.price ?? sel.preco ?? 0;
      return sum + (parseFloat(raw) || 0);
    }, 0);

    const dataToSave = {
      configuration: selectionsToSave,
      miniaturasData,
      precioTotal: totalPrice,
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

    const responseData = await response.json();

    // ✅ SweetAlert2 en lugar de alert normal
    Swal.fire({
      icon: 'success',
      title: 'Guardado',
      text: 'Configuración guardada con éxito, encontrarás tus configuraciones guardadas en tu perfil',
      showConfirmButton: false, // quitar el botón
      timer: 3500, // se cierra automáticamente después de 2 segundos (2000 ms)
      timerProgressBar: true // opcional: muestra barra de progreso
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
// Renderizado de miniaturas
// =======================
const container = document.querySelector('#miniaturasResumen');

miniaturasData.forEach((item, index) => {
  const wrapper = document.createElement('div');
  wrapper.className = 'thumb-wrapper';
  wrapper.style.position = 'relative';

  // Imagen base
  const imgBase = document.createElement('img');
  imgBase.src = item.base;
  imgBase.className = 'thumb tumb-original';
  wrapper.appendChild(imgBase);

  // Overlay container
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
      imgOverlay.className = 'thumb';
      imgOverlay.style.width = '100%';
      imgOverlay.style.height = '100%';
      imgOverlay.style.position = 'absolute';
      imgOverlay.style.top = '0';
      imgOverlay.style.left = '0';
      imgOverlay.style.pointerEvents = 'none';
      overlayDiv.appendChild(imgOverlay);
    });

    wrapper.appendChild(overlayDiv);
  }

  container.appendChild(wrapper);
});

// =======================
// Usar segunda miniatura como imagen principal con overlays
// =======================
const principalRender = document.querySelector('#principalRender');

if (miniaturasData.length > 1) {
  const item = miniaturasData[1]; // segunda miniatura

  const wrapper = document.createElement('div');
  wrapper.style.position = 'relative';
  wrapper.style.width = '100%';

  // Imagen base
  const imgBase = document.createElement('img');
  imgBase.src = item.base;
  imgBase.className = 'thumb tumb-original img-fluid rounded';
  wrapper.appendChild(imgBase);

  // Overlay container
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
      imgOverlay.className = 'thumb';
      imgOverlay.style.width = '100%';
      imgOverlay.style.height = '100%';
      imgOverlay.style.position = 'absolute';
      imgOverlay.style.top = '0';
      imgOverlay.style.left = '0';
      imgOverlay.style.pointerEvents = 'none';
      overlayDiv.appendChild(imgOverlay);
    });

    wrapper.appendChild(overlayDiv);
  }

  principalRender.appendChild(wrapper);
}