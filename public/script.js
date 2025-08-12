let selections = {};

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
        autoWidth: true, // <<--- en lugar de items

  });

  // ✅ Cambiar imagen principal y activar miniatura
  function cambiarImagen(index) {
    $carousel.trigger('to.owl.carousel', [index, 300]);

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

  const primeraOpcionCasa = document.querySelector('#opciones-casas .option-card');
  if (primeraOpcionCasa) {
    seleccionarCasa(primeraOpcionCasa);
  }

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
