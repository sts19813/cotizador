$(document).ready(function () {
  var $carousel = $('.gallery-carousel');
  var $preview = $('#mainPreview');

  $carousel.owlCarousel({
    items: 6,
    margin: 10,
    loop: true,
    nav: true,
    slideBy: 1, // para que next/prev se muevan 1 item y no 6, para controlar bien el slide actual
    navText: [
      '<img src="/img/Vector.svg" alt="prev" style="width:24px;transform: rotate(180deg);">',
      '<img src="/img/Vector.svg" alt="next" style="width:24px;">'
    ]
  });

  // Cambiar imagen principal y miniatura activa al hacer click en una miniatura
  $('.gallery-carousel .thumb').on('click', function () {
    const newSrc = $(this).attr('src');
    var index = $(this).closest('.owl-item').index();

    $preview.addClass('fade-out');
    setTimeout(function () {
      $preview.attr('src', newSrc);
      $preview.removeClass('fade-out');
    }, 300);

    $('.gallery-carousel .thumb').removeClass('active');
    $(this).addClass('active');

    // Mover carrusel a la miniatura clickeada
    $carousel.trigger('to.owl.carousel', [index, 300]);
  });

  // Al cambiar el slide (por next/prev o swipe), actualizar imagen principal y miniatura activa
  $carousel.on('changed.owl.carousel', function (event) {
    var currentIndex = event.item.index; // índice del item actual dentro de owl
    // En loop=true, owl tiene clones, ajustamos índice real
    var realIndex = event.page.index * event.page.size;

    // Tomamos la imagen en el índice real para que coincida con la miniatura visible
    var $currentThumb = $carousel.find('.owl-item').eq(currentIndex).find('img.thumb');

    if ($currentThumb.length) {
      var newSrc = $currentThumb.attr('src');

      $preview.addClass('fade-out');
      setTimeout(function () {
        $preview.attr('src', newSrc);
        $preview.removeClass('fade-out');
      }, 300);

      $('.gallery-carousel .thumb').removeClass('active');
      $currentThumb.addClass('active');
    }
  });

  // Función para cambiar imagen y mover carrusel a la miniatura deseada (por scroll)
  function cambiarImagenCarousel(index) {
    $carousel.trigger('to.owl.carousel', [index, 300]); // mueve carrusel al slide índice (0-based)

    var $thumb = $carousel.find('.owl-item').eq(index).find('img.thumb');
    if ($thumb.length) {
      var newSrc = $thumb.attr('src');
      $preview.addClass('fade-out');
      setTimeout(function () {
        $preview.attr('src', newSrc);
        $preview.removeClass('fade-out');
      }, 300);

      $('.gallery-carousel .thumb').removeClass('active');
      $thumb.addClass('active');
    }
  }

  // IntersectionObserver para cambiar miniatura según sección en pantalla
  let observerOptions = {
    root: null,
    rootMargin: '-40% 0px -40% 0px',
    threshold: 0.5
  };

  let secciones = [
    { id: '#collapseGeneral', carouselIndex: 2 },
    { id: '#collapseFachada', carouselIndex: 4 },
    { id: '#collapseColor', carouselIndex: 5 },
    { id: '#collapsePisos', carouselIndex: 6 },
    { id: '#collapseMesetas', carouselIndex: 1 }
  ];

  let observer = new IntersectionObserver(function (entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        let seccion = secciones.find(s => s.id === '#' + entry.target.id);
        if (seccion) {
          cambiarImagenCarousel(seccion.carouselIndex);
          console.log(seccion.carouselIndex);

        }
      }
    });
  }, observerOptions);

  secciones.forEach(s => {
    let element = document.querySelector(s.id);
    if (element) {
      observer.observe(element);
    }
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



function cambiarImagenes(estilo) {
  const nuevasImagenes = imagenesPorEstilo[estilo];
  const carouselInner = document.querySelector('#carouselExampleIndicatorsLeft .carousel-inner');
  const thumbnails = document.querySelector('.carousel-indicators');

  // Limpiar carrusel y thumbnails
  carouselInner.innerHTML = '';
  thumbnails.innerHTML = '';

  nuevasImagenes.forEach((imgSrc, index) => {
    // Slide principal
    const item = document.createElement('div');
    item.className = 'carousel-item' + (index === 0 ? ' active' : '');
    item.innerHTML = `<img src="${imgSrc}" class="d-block w-100" alt="...">`;
    carouselInner.appendChild(item);

    // Miniatura
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


document.querySelectorAll('.opcion-meseta').forEach(el => {
  el.addEventListener('click', function () {
    // Quitar selección anterior
    document.querySelectorAll('.opcion-meseta').forEach(item => item.classList.remove('border-primary'));

    // Marcar como seleccionado
    this.classList.add('border-primary');

    // Obtener precio
    precioMeseta = parseFloat(this.dataset.precio);

    actualizarPrecioTotal(); // Llama a tu función que actualiza el total
  });
});

function seleccionarCasa(elemento) {
  // Quitar 'active' de todas las tarjetas
  const tarjetas = document.querySelectorAll('#opciones-casas .estilo-casa');
  tarjetas.forEach(t => t.classList.remove('active', 'bg-primary', 'text-white'));

  // Agregar clase activa a la seleccionada
  elemento.classList.add('active', 'bg-primary', 'text-white');

  // Ejecutar lógica adicional si lo necesitas
  const valor = elemento.dataset.valor;
  cambiarImagenes(valor);
  precioEstilo = parseFloat(elemento.dataset.precio || 0);
  actualizarPrecioTotal();
}

function seleccionarFachada(elemento) {
  const tarjetas = document.querySelectorAll('#opciones-fachada .estilo-fachada');
  tarjetas.forEach(t => t.classList.remove('active', 'bg-primary', 'text-white'));
  elemento.classList.add('active', 'bg-primary', 'text-white');

  precioFachada = parseFloat(elemento.dataset.precio || 0);
  actualizarPrecioTotal();
}

function seleccionarColor(elemento) {
  const tarjetas = document.querySelectorAll('#opciones-color .estilo-color');
  tarjetas.forEach(t => t.classList.remove('active'));
  elemento.classList.add('active');

  precioColor = parseFloat(elemento.dataset.precio || 0);
  actualizarPrecioTotal();
}

function seleccionarPiso(elemento) {
  const tarjetas = document.querySelectorAll('#opciones-piso .estilo-piso');
  tarjetas.forEach(t => t.classList.remove('active'));
  elemento.classList.add('active');

  precioPiso = parseFloat(elemento.dataset.precio || 0);
  actualizarPrecioTotal();
}

function actualizarPrecioTotal() {
  const total = precioEstilo + precioFachada + precioColor + precioPiso + precioMeseta;
  const formato = total.toLocaleString('es-MX', { style: 'currency', currency: 'MXN' });

  document.querySelectorAll('.precio-total').forEach(el => {
    el.textContent = formato;
  });
}
