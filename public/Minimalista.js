let selections = {};
let globalindex = 0;
let activeOverlays = {};
let selectedFachada = null;
// Loader helpers y token global
let currentLoadToken = 0;
function showLoader() {
  $('#imageLoader').show();
}
function hideLoader() {
  $('#imageLoader').fadeOut(120);
}


$(document).on('click', '.accordion-button', function () {
  const section = $(this).closest('.accordion-item').find('.row');
  const index = section.data('carousel-index');
  if (index !== undefined) {
    cambiarImagen(index);
  }
});


$(document).ready(function () {
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
    autoWidth: true, // <<--- en lugar de items
  });

  // ✅ Cambiar imagen principal y activar miniatura
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

  // ✅ Click en miniatura
  $carousel.on('click', '.thumb', function () {
    const index = $(this).closest('.owl-item').index();
    cambiarImagen(index);
  });

  // ✅ Inicializar seleccionando la primera imagen
  cambiarImagen(0);

  // ✅ IntersectionObserver para secciones
  const observerOptions = {
    root: null,
    rootMargin: '-40% 0px -40% 0px',
    threshold: 0.5
  };

  const secciones = [
    { id: '#opciones-fachada', carouselIndex: 0 },
    { id: '#heading-22', carouselIndex: 4 },
    { id: '#heading-27', carouselIndex: 4 },
    { id: '#heading-28', carouselIndex: 4 },
    { id: '#heading-32', carouselIndex: 4 },
    { id: '#heading-24', carouselIndex: 5 },
    { id: '#heading-33', carouselIndex: 6 },
    { id: '#heading-38', carouselIndex: 6 },
    { id: '#heading-35', carouselIndex: 6 },
    { id: '#heading-39', carouselIndex: 6 },
    { id: '#heading-23', carouselIndex: 7 },
    { id: '#heading-25', carouselIndex: 7 },
    { id: '#heading-26', carouselIndex: 7 },
    { id: '#heading-36', carouselIndex: 7 },
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

const imagenesPorEstilo = {
  Tulum: ["/img/Tulum/Fachada A/F.jpg", "/img/Tulum/Fachada A/B.jpg", "/img/Tulum/Fachada A/L.jpg", "/img/Tulum/Fachada A/R.jpg"],
  Mexicano: ["/img/Mexicano/Fachada A/B.jpg", "/img/Mexicano/Fachada A/F.jpg", "/img/Mexicano/Fachada A/L.jpg", "/img/Mexicano/Fachada A/R.jpg"],
  Minimalista: ["/img/Minimalista/Fachada A/R.jpg", "/img/Minimalista/Fachada A/B.jpg", "/img/Minimalista/Fachada A/F.jpg", "/img/Minimalista/Fachada A/L.jpg"]
};

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

function cambiarImagenes(estilo) {
  const nuevasImagenes = imagenesPorEstilo[estilo];
  const carouselInner = document.querySelector('#carouselExampleIndicatorsLeft .carousel-inner');
  const thumbnails = document.querySelector('.carousel-indicators');

  carouselInner.innerHTML = '';
  thumbnails.innerHTML = '';

  nuevasImagenes.forEach((imgSrc, index) => {
    const item = document.createElement('div');
    item.className = 'carousel-item' + (index === 0 ? ' active' : '');
    item.innerHTML = `<img src="${imgSrc}" class="d-block w-100" alt="...">`;
    carouselInner.appendChild(item);

    const thumb = document.createElement('button');
    thumb.type = 'button';
    thumb.setAttribute('data-bs-target', '#carouselExampleIndicatorsLeft');
    thumb.setAttribute('data-bs-slide-to', index);
    if (index === 0) {
      thumb.classList.add('active');
      thumb.setAttribute('aria-current', 'true');
    }
    thumb.setAttribute('aria-label', 'Slide ' + (index + 1));
    thumb.innerHTML = `<img class="d-block w-200" src="${imgSrc}" class="img-fluid">`;
    thumbnails.appendChild(thumb);
  });
}

// ✅ Inicializar thumb wrappers en el carrusel
function prepararMiniaturas() {
  $('.gallery-carousel .item').each(function () {
    const img = $(this).find('img.thumb');
    if (!img.parent().hasClass('thumb-wrapper')) {
      img.wrap('<div class="thumb-wrapper" style="position:relative;"></div>');
      img.after('<div class="overlay-container" class="thumb" style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;"></div>');
    }
  });
}

function updateThumbnailOverlay(index) {
  const $thumbWrapper = $('.gallery-carousel .owl-item').eq(index).find('.thumb-wrapper');
  const $overlayContainer = $thumbWrapper.find('.overlay-container');
  $overlayContainer.empty();
  if (activeOverlays[index]) {
    activeOverlays[index].forEach(ov => {
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
    });
  }
}

function updateMainPreview(index) {
  const mainPreview = document.getElementById('mainPreview');
  const previewWrapper = mainPreview.parentElement;

  // Buscar o crear contenedor para overlays en imagen principal
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

    previewWrapper.style.position = 'relative'; // Asegura posición relativa
    previewWrapper.appendChild(overlayMainContainer);
  }

  // Limpia overlays previos
  overlayMainContainer.innerHTML = '';

  if (activeOverlays[index] && activeOverlays[index].length > 0) {
    activeOverlays[index].forEach(ov => {
      const img = document.createElement('img');
      img.src = ov.url;
      img.style.position = 'absolute';
      img.style.top = '0';
      img.style.left = '0';
      img.style.width = '100%';
      img.style.height = '100%';
      img.style.pointerEvents = 'none';
      overlayMainContainer.appendChild(img);
    });
  }
}
function seleccionarOpcion(elemento) {
  const categoria = elemento.getAttribute('data-categoria');
  const valor = elemento.getAttribute('data-valor');

  // ===== Fachada =====
  if (categoria === 'Fachada') {
    selectedFachada = valor;
    const rendersFachada = JSON.parse(elemento.getAttribute('data-fachada-renders'));
    const fachadaData = rendersFachada[selectedFachada];
    const items = document.querySelectorAll('#owl-demo .item img.thumb');
    CambioBases(items, valor);

    if (fachadaData) {

      for (let i = 0; i < 4; i++) {
        const src = fachadaData[`base_image_${i + 1}`];
        if (src && items[i]) items[i].src = src;
      }
      items[0].dispatchEvent(new Event('click', { bubbles: true }));
    }

    // Limpiar todos los overlays
    Object.keys(activeOverlays).forEach(idx => {
      activeOverlays[idx] = [];
      updateThumbnailOverlay(idx);
    });
    const overlayMainContainer = document.getElementById('overlayMainContainer');
    if (overlayMainContainer) overlayMainContainer.innerHTML = '';
    return;
  }

  // ===== Productos =====
  const renders = JSON.parse(elemento.getAttribute('data-renders'));
  const fachadaRenders = selectedFachada 
    ? JSON.parse(elemento.getAttribute('data-fachada-renders'))[selectedFachada] 
    : null;

  // ✅ 1. Eliminar overlays antiguos de la misma categoría y sus fachadas asociadas
  Object.keys(activeOverlays).forEach(idx => {
    activeOverlays[idx] = activeOverlays[idx]?.filter(o => {
      return o.categoria !== categoria && o.categoria !== 'Fachada_' + categoria;
    }) || [];
  });

  // ✅ 2. Agregar overlays del producto seleccionado
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

  // ✅ 3. Agregar overlays de la fachada del producto (solo primeras 4 imágenes)
  if (fachadaRenders) {
    for (let i = 1; i <= 4; i++) {
      const imgPath = fachadaRenders[`base_image_${i}`];
      if (imgPath) {
        const index = i - 1;
        if (!activeOverlays[index]) activeOverlays[index] = [];
        // Guardamos categoría combinada para poder eliminarla correctamente luego
        activeOverlays[index].push({ categoria: 'Fachada_' + categoria, url: imgPath });
      }
    }
  }

  // ✅ 4. Actualizar todas las miniaturas
  Object.keys(activeOverlays).forEach(idx => updateThumbnailOverlay(idx));

  // ✅ 5. Actualizar imagen principal
  updateMainPreview(globalindex);
}
// ✅ Ejecutar al cargar la página
$(document).ready(function () {
  prepararMiniaturas();
});

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

      // Aquí guardamos un objeto con más info
      const data = {};
      Array.from(this.attributes).forEach(attr => {
        if (attr.name.startsWith('data-')) {
          // Convierte data-pre_code a pre_code, data-valor a valor, etc.
          const key = attr.name.replace('data-', '').replace(/-/g, '_');
          data[key] = attr.value;
        }
      });
      // Convierte precio a número si existe
      if (data.precio) data.precio = parseFloat(data.precio) || 0;

      selections[groupId] = data;
    }

    console.log(selections);
    localStorage.setItem('selections', JSON.stringify(selections));
  });
});
// Función para enviar configuración al backend

/*******opciones  */



document.addEventListener('DOMContentLoaded', function () {
  // Selecciona la primera opción de cada categoría dinámica
   document.querySelectorAll('.row.g-3[id^="opciones-"]').forEach(row => {
    // Excluye la fila de estilos (ajusta el selector según tu HTML)
    if (row.id === 'opciones-casas') return;
    const firstOption = row.querySelector('.option-card');
    if (firstOption) firstOption.click();
  });

  // Si necesitas seleccionar específicamente la recámara, hazlo solo si no está seleccionada
  setTimeout(() => {
    const recamara = document.querySelector('#Habitaciones [data-id="1Recamara"]');
    if (recamara && !recamara.classList.contains('selected')) recamara.click();
  }, 100);
});