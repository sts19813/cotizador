let selections = {};
let globalindex = 0;
let activeOverlays = {};
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
    { id: '#heading-37', carouselIndex: 5 },


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
      img.after('<div class="overlay-container" style="position:absolute;top:0;left:0;width:100%;height:100%;pointer-events:none;"></div>');
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
  const mainPreview = document.getElementById('mainPreview');
  const carrusel = document.getElementById('owl-demo');

  // Manejo especial para Fachada
  if (categoria === 'fachada' && (valor === 'Fachada A' || valor === 'Fachada B')) {
    if (carrusel) {
      const items = carrusel.querySelectorAll('.item img.thumb');
      if (items.length >= 4) {
        if (valor === 'Fachada B') {
          items[0].src = '/baseMinimalista/fachadaB/01-F.jpg';
          items[1].src = '/baseMinimalista/fachadaB/02-R.jpg';
          items[2].src = '/baseMinimalista/fachadaB/03-L.jpg';
          items[3].src = '/baseMinimalista/fachadaB/04-B.jpg';
        } else {
          items[0].src = '/baseMinimalista/fachadaA/01-F.jpg';
          items[1].src = '/baseMinimalista/fachadaA/02-R.jpg';
          items[2].src = '/baseMinimalista/fachadaA/03L.jpg';
          items[3].src = '/baseMinimalista/fachadaA/04-B.jpg';
        }
      }
    }
    if (mainPreview) {
      if (valor === 'Fachada B') {
        mainPreview.src = '/baseMinimalista/fachadaB/01-F.jpg';
      } else {
        mainPreview.src = '/baseMinimalista/fachadaA/01-F.jpg';
      }
    }
    return; // Salir para que no aplique la lógica de overlays
  }

  // Lógica general para actualizar overlays (pisos, paredes, etc)
  const renders = JSON.parse(elemento.getAttribute('data-renders'));

  // 1. Eliminar overlays anteriores de esta categoría
  Object.keys(activeOverlays).forEach(idx => {
    activeOverlays[idx] = activeOverlays[idx]?.filter(o => o.categoria !== categoria) || [];
    updateThumbnailOverlay(idx);
  });

  // 2. Agregar nuevos overlays
  for (let i = 1; i <= 9; i++) {
    const imgPath = renders[`image_${i}`];
    if (imgPath) {
      const index = i - 1;
      if (!activeOverlays[index]) activeOverlays[index] = [];
      activeOverlays[index].push({ categoria, url: imgPath });
      updateThumbnailOverlay(index);
    }
  }

  // 3. Actualizar imagen principal si la miniatura actual tiene overlays
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
    const cardId = this.getAttribute('data-id');

    if (this.classList.contains('selected')) {
      this.classList.remove('selected');
      selections[groupId] = null;
    } else {
      group.querySelectorAll('.option-card').forEach(c => c.classList.remove('selected'));
      this.classList.add('selected');

      // Aquí guardamos un objeto con más info
      selections[groupId] = {
        id: cardId,
        valor: this.getAttribute('data-valor'),
        categoria: this.getAttribute('data-categoria'),
        precio: parseFloat(this.getAttribute('data-precio')) || 0
      };
    }

    console.log(selections);
    localStorage.setItem('selections', JSON.stringify(selections));
  });
});
// Función para enviar configuración al backend
async function saveConfiguration() {
  try {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    // Calcula el precio total sumando los precios de cada selección
    const totalPrice = Object.values(selections).reduce((sum, sel) => {
      return sel && sel.precio ? sum + sel.precio : sum;
    }, 0);

    const dataToSave = {
      configuration: selections,
      precioTotal: totalPrice,
      fecha: new Date().toISOString(),
    };

    const response = await fetch('/house-configurations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': token,
        'Accept': 'application/json'
      },
      credentials: 'include',
      body: JSON.stringify(dataToSave)
    });

    if (!response.ok) {
      const errorData = await response.json();
      throw new Error(errorData.message || 'Error desconocido al guardar');
    }

    const responseData = await response.json();
    alert("Guardado con éxito: " + (responseData.message || ''));

  } catch (error) {
    alert("Error al guardar: " + error.message);
  }
}
document.querySelector('#capturar').addEventListener('click', () => {
    const elemento = document.querySelector('#owl-demo');

    html2canvas(elemento).then(canvas => {
        const dataURL = canvas.toDataURL('image/png');
        localStorage.setItem('imagenResumen', dataURL);
        window.location.href = '/resumen'; // redirigir a la vista resumen
    });
});

/*******opciones  */

function setOverlays(container, overlayImageUrls) {
  // Limpia overlays previos
  while (container.firstChild) {
    container.removeChild(container.firstChild);
  }
  // Inserta overlays
  overlayImageUrls.forEach(url => {
    const img = document.createElement('img');
    img.src = url;
    img.style.position = 'absolute';
    img.style.top = '0';
    img.style.left = '0';
    img.style.width = '100%';
    img.style.height = '100%';
    img.style.pointerEvents = 'none';
    img.style.userSelect = 'none';
    // Opcional: agrega opacidad o mezcla, p.ej. img.style.opacity = '0.7';
    container.appendChild(img);
  });
}
document.addEventListener('DOMContentLoaded', function () {
  // Simula clic en la primera opción de estilo
  const primerEstilo = document.querySelector('#opciones-casas .option-card');
  if (primerEstilo) {
    primerEstilo.click();
  }

  document.querySelector('#opciones-fachada [data-id="1"]').click();
  document.querySelector(' [data-id="1Recamara"]').click();
});