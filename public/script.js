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
