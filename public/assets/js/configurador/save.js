///método que guarda la configuracion en base de datos de la seleccion y configuracion de la casa
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
