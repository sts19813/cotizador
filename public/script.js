let selections = {};
let globalindex = 0;
$(document).ready(function () {
  const $carousel = $('.gallery-carousel');
  const $preview = $('#mainPreview');

  $carousel.owlCarousel({
    items: 6,
    margin: 10,
    nav: true,
    dots: false,
    navText: [
      '<img src="/img/Vector.svg" alt="prev" style="width:24px;transform: rotate(180deg);">',
      '<img src="/img/Vector.svg" alt="next" style="width:24px;">'
    ],
    responsive: {
      0: { items: 3 },
      600: { items: 4 },
      1000: { items: 6 }
    }
  });

  // ✅ Cambiar imagen principal y activar miniatura
  function cambiarImagen(index) {
    globalindex = index;
    $carousel.trigger('to.owl.carousel', [index, 300]);
    const overlayMain = document.getElementById('overlayMain');
    if (overlayMain) {
      overlayMain.style.display = 'none';
    }
    const $thumb = $carousel.find('.owl-item').eq(index).find('img.thumb');
    if ($thumb.length) {
      const newSrc = $thumb.attr('src');

      $preview.addClass('fade-out');
      setTimeout(() => {
        $preview.attr('src', newSrc).removeClass('fade-out');
      }, 300);

      $('.gallery-carousel .thumb').removeClass('thumb-selected');
      $thumb.addClass('thumb-selected');
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
    { id: '#opciones-casas', carouselIndex: 0 },
    { id: '#opciones-fachada', carouselIndex: 1 },
    { id: '#Color', carouselIndex: 2 },
    { id: '#Pisos', carouselIndex: 6 },
    { id: '#Mesetas', carouselIndex: 3 }
  ];

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const seccion = secciones.find(s => s.id === '#' + entry.target.id);
        if (seccion) {
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

function seleccionarCasa(elemento) {
  debugger

  if(elemento.dataset.id === "generalTulum"){
    window.location.href = "/test/Tulum";
  }

  if(elemento.dataset.id === "generalMinimalista"){
    window.location.href = "/test";
  }

  const tarjetas = document.querySelectorAll('#opciones-casas .option-card');
  tarjetas.forEach(t => t.classList.remove('active'));
  elemento.classList.add('active');

  const valor = elemento.dataset.id.replace('general', '').toLowerCase();
  //cambiarImagenes(valor);

  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioEstilo = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarHabitacion(elemento) {
  document.querySelectorAll('#opciones-habitaciones .option-card').forEach(item => {
    item.classList.remove('active', 'border-primary');
  });

  elemento.classList.add('active', 'border-primary');

  const precio = parseFloat(elemento.dataset.precio) || 0;
  precioHabitaciones = precio;

  actualizarPrecioTotal();
}

function seleccionarFachada(elemento) {
  const tarjetas = document.querySelectorAll('#opciones-fachada .option-card');
  tarjetas.forEach(t => t.classList.remove('active'));
  elemento.classList.add('active');

  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioFachada = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarColor(elemento) {
  document.querySelectorAll('#opciones-color .option-card').forEach(item => {
    item.classList.remove('active', 'border-primary');
  });
  elemento.classList.add('active', 'border-primary');
  precioColor = parseFloat(elemento.dataset.precio) || 0;
  actualizarPrecioTotal();
}

function seleccionarPiso(elemento) {
  const tarjetas = document.querySelectorAll('#opciones-piso .estilo-piso');
  tarjetas.forEach(t => t.classList.remove('active'));
  elemento.classList.add('active');

  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioPiso = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarMeseta(elemento) {
  document.querySelectorAll('.opcion-meseta').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioMeseta = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarCanceleria(elemento) {
  document.querySelectorAll('.opcion-canceleria').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioCanceleria = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarPuerta(elemento) {
  document.querySelectorAll('.opcion-puerta').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioPuerta = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarAddon(elemento) {
  document.querySelectorAll('.opcion-addon').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioAddon = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarInterior(elemento) {
  document.querySelectorAll('.opcion-interior').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioInterior = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarExterior(elemento) {
  document.querySelectorAll('.opcion-exterior').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioExterior = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}

function seleccionarJardines(elemento) {
  document.querySelectorAll('.opcion-jardines').forEach(item => item.classList.remove('border-primary'));
  elemento.classList.add('border-primary');
  const precioTexto = elemento.querySelector('.option-price').textContent;
  precioJardin = parseFloat(precioTexto.replace(/[^0-9.-]+/g, ""));
  actualizarPrecioTotal();
}



function actualizarPrecioTotal() {

  let precioBase = 1500000;

  const total = precioBase + precioEstilo + precioFachada + precioColor + precioPiso + precioMeseta +
    precioCanceleria + precioPuerta + precioAddon + precioInterior +
    precioExterior + precioJardin + precioHabitaciones;

  const formato = total.toLocaleString('es-MX', {
    style: 'currency',
    currency: 'MXN',
    minimumFractionDigits: 2,
    maximumFractionDigits: 2
  });

  document.querySelectorAll('.precio-total').forEach(el => {
    el.textContent = formato;
  });
}

document.addEventListener('DOMContentLoaded', function () {


  document.querySelectorAll('#opciones-casas .option-card').forEach(el => {
    el.addEventListener('click', function () {
      seleccionarCasa(this);
    });
  });

  document.querySelectorAll('#opciones-fachada .option-card').forEach(el => {
    el.addEventListener('click', function () {
      seleccionarFachada(this);
    });
  });



  document.querySelectorAll('#opciones-color .option-card').forEach(el => {
    el.addEventListener('click', function () {
      seleccionarColor(this);
    });
  });

  const primerColor = document.querySelector('#opciones-color .option-card');
  if (primerColor) {
    seleccionarColor(primerColor);
  }
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
      selections[groupId] = cardId;
    }

    console.log(selections);
    localStorage.setItem('selections', JSON.stringify(selections));


  });
});

// Función para enviar configuración al backend
async function saveConfiguration() {
  try {
    // Obtener el token CSRF del meta tag
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    // Enviar la petición POST con fetch
    const response = await fetch('/house-configurations', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-TOKEN': token,
        'Accept': 'application/json'
      },
      credentials: 'include',  // Esto asegura enviar cookies de sesión (para autenticación)
      body: JSON.stringify({
        configuration: selections
      })
    });

    // Verificar si la respuesta fue exitosa
    if (!response.ok) {
      debugger
      const errorData = await response.json();
      throw new Error(errorData.message || 'Error desconocido al guardar');
    }

    // Obtener la respuesta JSON
    const responseData = await response.json();

    alert("Guardado con éxito: " + (responseData.message || ''));

  } catch (error) {
    debugger
    alert("Error al guardar: " + error.message);
  }
}



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

function seleccionarOpcion(elemento) {
  
  const categoria = elemento.getAttribute('data-categoria');
  const valor = elemento.getAttribute('data-valor');
  const mainPreview = document.getElementById('mainPreview');
  const id = elemento.getAttribute('data-id');

  // Para overlays en principal
  const mainOverlaysContainer = document.getElementById('mainOverlays');

  // Carrusel y sus items
  const carrusel = document.getElementById('owl-demo');

  // Limpiar overlays generales primero (si existen)
  if (mainOverlaysContainer) setOverlays(mainOverlaysContainer, []);
  if (carrusel) {
    const items = carrusel.querySelectorAll('.item');
    items.forEach(item => {
      const overlayContainer = item.querySelector('.overlay-container');
      if (overlayContainer) setOverlays(overlayContainer, []);
    });
  }

  // --- Lógica Fachada A / B ---
  if (categoria === 'fachada' && (valor === 'Opción A' || valor === 'Opción B')) {
    if (carrusel) {
      const items = carrusel.querySelectorAll('.item img.thumb');
      if (items.length >= 4) {
        if (valor === 'Opción B') {
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
      if (valor === 'Opción B') {
        mainPreview.src = '/baseMinimalista/fachadaB/01-F.jpg';
      } else {
        mainPreview.src = '/baseMinimalista/fachadaA/01-F.jpg';
      }
    }
    return; // Salir aquí para no hacer más cambios
  }

  // --- Lógica Pisos Interiores id 79 con overlays ---
  if (categoria === 'pisos-interiores' && id === '79') {

    const overlayImages = [
      '/baseMinimalista/PISOS/Cocina/COCINA-M01.png', // para índice 4
      '/baseMinimalista/PISOS/Recamara/CUARTO-M01.png', // para índice 5
      '/baseMinimalista/PISOS/Sala/SALA-M01.png'  // para índice 6
    ];


    // 1) Cambiar imagen principal base si quieres

    // Mostrar y cambiar overlayMain
    const overlayMain = document.getElementById('overlayMain');
    if (overlayMain && globalindex >= 4 && globalindex <= 6) {
      overlayMain.src = overlayImages[globalindex - 4];
      overlayMain.style.display = 'block';
    } else if (overlayMain) {
      debugger
      overlayMain.style.display = 'none'; // Oculta si el índice no tiene overlay
    }

    // Ahora overlays para miniaturas 5,6,7 (índices 4,5,6)
    if (carrusel) {
      const items = carrusel.querySelectorAll('.item');
      [4, 5, 6].forEach((i, idx) => {
        const item = items[i];
        if (item) {
          let overlayContainer = item.querySelector('.overlay-container');
          if (!overlayContainer) {
            overlayContainer = document.createElement('div');
            overlayContainer.classList.add('overlay-container');
            overlayContainer.style.position = 'absolute';
            overlayContainer.style.top = '0';
            overlayContainer.style.left = '0';
            overlayContainer.style.width = '100%';
            overlayContainer.style.height = '100%';
            overlayContainer.style.pointerEvents = 'none';
            overlayContainer.style.userSelect = 'none';
            item.style.position = 'relative';
            item.appendChild(overlayContainer);
          }

          // Asignar overlay específico por índice
          setOverlays(overlayContainer, [overlayImages[idx]]);
        }
      });
    }



    return; // Salir para evitar más cambios
  }
  if (categoria === 'pisos-interiores' && id === '80') {

    const overlayImages = [
      '/baseMinimalista/PISOS/Cocina/COCINA-M02.png',   // Índice 4
      '/baseMinimalista/PISOS/Recamara/CUARTO-M02.png', // Índice 5
      '/baseMinimalista/PISOS/Sala/SALA-M02.png'        // Índice 6
    ];
    
    // Mostrar y cambiar overlay principal
    const overlayMain = document.getElementById('overlayMain');
    if (overlayMain && globalindex >= 4 && globalindex <= 6) {
      overlayMain.src = overlayImages[globalindex - 4];
      overlayMain.style.display = 'block';
    } else if (overlayMain) {
      overlayMain.style.display = 'none'; // Oculta si el índice no es 4-6
    }
    // Aplicar overlays en los elementos del carrusel
    if (carrusel) {
      const items = carrusel.querySelectorAll('.item');
      [4, 5, 6].forEach((i, idx) => {
        const item = items[i];
        if (item) {
          let overlayContainer = item.querySelector('.overlay-container');
          if (!overlayContainer) {
            overlayContainer = document.createElement('div');
            overlayContainer.classList.add('overlay-container');
            overlayContainer.style.position = 'absolute';
            overlayContainer.style.top = '0';
            overlayContainer.style.left = '0';
            overlayContainer.style.width = '100%';
            overlayContainer.style.height = '100%';
            overlayContainer.style.pointerEvents = 'none';
            overlayContainer.style.userSelect = 'none';
            item.style.position = 'relative';
            item.appendChild(overlayContainer);
          }

          // Asignar overlay específico por índice
          setOverlays(overlayContainer, [overlayImages[idx]]);
        }
      });
    }
  }

}