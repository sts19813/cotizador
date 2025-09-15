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
    const wrappers = document.querySelectorAll('.thumb-wrapper');
    const imagenesBase64 = [];
    let procesadas = 0;

    wrappers.forEach((wrapper, index) => {
        html2canvas(wrapper, {
            backgroundColor: null, // mantiene transparencia si la hay
            useCORS: true // por si hay imágenes externas
        }).then(canvas => {
            imagenesBase64[index] = canvas.toDataURL('image/png');
            procesadas++;

            // Cuando se procesen todas las imágenes individuales
            if (procesadas === wrappers.length) {
                localStorage.setItem('imagenesCarrusel', JSON.stringify(imagenesBase64));

                // Capturamos el resumen completo como ya hacías
                const elemento = document.querySelector('#owl-demo');
                html2canvas(elemento, { useCORS: true }).then(canvas => {
                    const resumenBase64 = canvas.toDataURL('image/png');
                    localStorage.setItem('imagenResumen', resumenBase64);

                    // Redirigir a la vista resumen
                    window.location.href = '/resumen';
                });
            }
        });
    });
});
