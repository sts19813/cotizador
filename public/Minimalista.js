/**********************************************************
 * VARIABLES GLOBALES
 **********************************************************/
let selections = {};
let globalindex = 0;
let activeOverlays = {};
let selectedFachada = null;
let currentLoadToken = 0; // Loader helpers y token global

// Precios por categorías
let precioEstilo = 0;
let precioFachada = 0;
let precioColor = 0;
let precioPiso = 0;
let precioMeseta = 0;
let precioCanceleria = 0;
let precioPuerta = 0;
let precioAddon = 0;
let precioInterior = 0;
let precioExterior = 0;
let precioJardin = 0;
let precioHabitaciones = 0;


/**********************************************************
 * LOADER
 **********************************************************/
function showLoader() {
  $('#imageLoader').show();
}
function hideLoader() {
  $('#imageLoader').fadeOut(120);
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

function updateThumbnailOverlay(index) {
  const $thumbWrapper = $('.gallery-carousel .owl-item').eq(index).find('.thumb-wrapper');
  const $overlayContainer = $thumbWrapper.find('.overlay-container');
  $overlayContainer.empty();

  if (activeOverlays[index]) {
    activeOverlays[index].forEach(ov => {
      if (isValidImageUrl(ov.url)) {
        const img = document.createElement('img');
        img.src = ov.url;
        img.classList.add('thumb');
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.position = 'absolute';
        img.style.top = '0';
        img.style.left = '0';
        img.style.pointerEvents = 'none';
        $overlayContainer.append(img);
      }
    });
  }
}

function updateMainPreview(index) {
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

  overlayMainContainer.innerHTML = '';

  if (activeOverlays[index] && activeOverlays[index].length > 0) {
    activeOverlays[index].forEach(ov => {
      if (isValidImageUrl(ov.url)) {
        const img = document.createElement('img');
        img.src = ov.url;
        img.style.position = 'absolute';
        img.style.top = '0';
        img.style.left = '0';
        img.style.width = '100%';
        img.style.height = '100%';
        img.style.pointerEvents = 'none';
        overlayMainContainer.appendChild(img);
      }
    });
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
      $preview.addClass('fade-out');
      setTimeout(() => {
        $preview.attr('src', newSrc).removeClass('fade-out');
        updateMainPreview(index);
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


/**********************************************************
 * SELECCIONAR OPCIONES
 **********************************************************/
function seleccionarOpcion(elemento) {
  const categoria = elemento.getAttribute('data-categoria');
  const valor = elemento.getAttribute('data-valor');

  // ===== Fachada =====
  if (categoria === 'Fachada') {
    selectedFachada = valor;
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

  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx));
  updateMainPreview(globalindex);
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
    dots: false,
    navText: [
      '<img src="/img/Vector.svg" alt="prev" style="width:24px;transform: rotate(180deg);">',
      '<img src="/img/Vector.svg" alt="next" style="width:24px;">'
    ],
    autoWidth: true,
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


  const secciones = [
    { id: '#heading-1', carouselIndex: 0 },
    { id: '#heading-9', carouselIndex: 0 },
    { id: '#heading-10', carouselIndex: 0 },
    { id: '#heading-11', carouselIndex: 0 },
    { id: '#heading-12', carouselIndex: 4 },
    { id: '#heading-2', carouselIndex: 4 },
    { id: '#heading-7', carouselIndex: 4 },
    { id: '#heading-8', carouselIndex: 4 },
    { id: '#heading-13', carouselIndex: 5 },
    { id: '#heading-15', carouselIndex: 6 },
    { id: '#heading-4', carouselIndex: 6 },
    { id: '#heading-19', carouselIndex: 6 },
    { id: '#heading-16', carouselIndex: 6 },
    { id: '#heading-20', carouselIndex: 7 },
    { id: '#heading-3', carouselIndex: 7 },
    { id: '#heading-5', carouselIndex: 7 },
    { id: '#heading-6', carouselIndex: 7 },
    { id: '#heading-17', carouselIndex: 7 },
    { id: '#heading-18', carouselIndex: 7 },


    { id: '#heading-21', carouselIndex: 0 },
    { id: '#heading-29', carouselIndex: 0 },
    { id: '#heading-30', carouselIndex: 0 },
    { id: '#heading-31', carouselIndex: 0 },
    { id: '#heading-22', carouselIndex: 4 },
    { id: '#heading-27', carouselIndex: 4 },
    { id: '#heading-28', carouselIndex: 4 },
    { id: '#heading-32', carouselIndex: 4 },
    { id: '#heading-34', carouselIndex: 5 },
    { id: '#heading-24', carouselIndex: 6 },
    { id: '#heading-33', carouselIndex: 6 },
    { id: '#heading-38', carouselIndex: 6 },
    { id: '#heading-35', carouselIndex: 6 },
    { id: '#heading-39', carouselIndex: 7 },
    { id: '#heading-23', carouselIndex: 7 },
    { id: '#heading-25', carouselIndex: 7 },
    { id: '#heading-26', carouselIndex: 7 },
    { id: '#heading-36', carouselIndex: 7 },
    { id: '#heading-37', carouselIndex: 7 },

    { id: '#heading-58', carouselIndex: 0 },
    { id: '#heading-47', carouselIndex: 0 },
    { id: '#heading-48', carouselIndex: 0 },
    { id: '#heading-40', carouselIndex: 0 },
    { id: '#heading-45', carouselIndex: 4 },
    { id: '#heading-46', carouselIndex: 4 },
    { id: '#heading-49', carouselIndex: 4 },
    { id: '#heading-51', carouselIndex: 4 },
    { id: '#heading-42', carouselIndex: 5 },
    { id: '#heading-50', carouselIndex: 6 },
    { id: '#heading-55', carouselIndex: 6 },
    { id: '#heading-57', carouselIndex: 6 },
    { id: '#heading-56', carouselIndex: 6 },
    { id: '#heading-41', carouselIndex: 7 },
    { id: '#heading-43', carouselIndex: 7 },
    { id: '#heading-44', carouselIndex: 7 },
    { id: '#heading-53', carouselIndex: 7 },
    { id: '#heading-54', carouselIndex: 7 },
  ];






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
document.querySelectorAll('.option-card').forEach(card => {
  card.addEventListener('click', function () {
    const group = this.closest('.accordion-collapse');
    const groupId = group.id;

    if (this.classList.contains('selected')) {
      this.classList.remove('selected');
      selections[groupId] = null;
    } else {
      group.querySelectorAll('.option-card').forEach(c => c.classList.remove('selected'));
      this.classList.add('selected');

      const data = {};
      Array.from(this.attributes).forEach(attr => {
        if (attr.name.startsWith('data-')) {
          const key = attr.name.replace('data-', '').replace(/-/g, '_');
          data[key] = attr.value;
        }
      });
      if (data.precio) data.precio = parseFloat(data.precio) || 0;
      selections[groupId] = data;
    }

    console.log(selections);
    localStorage.setItem('selections', JSON.stringify(selections));
  });
});


/**********************************************************
 * AUTO-SELECCIÓN AL CARGAR
 **********************************************************/
document.addEventListener('DOMContentLoaded', function () {
  document.querySelectorAll('.row.g-3[id^="opciones-"]').forEach(row => {
    if (row.id === 'opciones-casas') return;
    const firstOption = row.querySelector('.option-card');
    if (firstOption) firstOption.click();
  });

  setTimeout(() => {
    const recamara = document.querySelector('#Habitaciones [data-id="1Recamara"]');
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

        // Guardar en el objeto global de selecciones
        const data = {};
        Array.from(option.attributes).forEach(attr => {
          if (attr.name.startsWith('data-')) {
            const key = attr.name.replace('data-', '').replace(/-/g, '_');
            data[key] = attr.value;
          }
        });
        if (data.precio) data.precio = parseFloat(data.precio) || 0;
        selections[rowId] = data;

        localStorage.setItem('selections', JSON.stringify(selections));
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