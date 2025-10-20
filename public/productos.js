/**
 * ===============================================================
 * DataTables - Inicialización de tabla productos
 * ===============================================================
 */
$(document).ready(function() {
    $('#productsTable').DataTable({
        autoWidth: true,
        columnDefs: [
            { width: '400px', targets: 4 },
            { width: '100px', targets: 7 }
        ],
        language: { url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json' },
        responsive: true,
        dom:
        "<'row mb-3'<'col-12 d-flex justify-content-end'f>>" + // buscador arriba derecha
        "<'row'<'col-12'tr>>" +                               // tabla
        "<'row mt-3'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'p>>" // select y paginación abajo

    });
});

/**
 * ===============================================================
 * Editar producto - llenar modal con datos del botón
 * ===============================================================
 */
$(document).on('click', '.btn-edit-product', function() {
    const button = $(this);
    const form = $('#editForm');

    // Actualizar acción del formulario
    form.attr('action', `/admin/products/${button.data('id')}`);

    // Campos principales
    form.find('[name="category_id"]').val(button.data('category_id'));
    form.find('[name="style"]').val(button.data('style'));
    form.find('[name="pre_code"]').val(button.data('pre_code'));
    form.find('[name="variant_code"]').val(button.data('variant_code'));
    form.find('[name="version"]').val(button.data('version'));
    form.find('[name="title"]').val(button.data('title'));
    form.find('[name="description"]').val(button.data('description'));
    form.find('[name="brand"]').val(button.data('brand'));
    form.find('[name="base_price"]').val(button.data('base_price'));
    form.find('[name="image_url"]').val(button.data('image_url'));
    form.find('[name="product_url"]').val(button.data('product_url'));

    // Precios por fachadas
    for (let i = 1; i <= 7; i++) {
        form.find(`[name="fachada_${i}_price"]`).val(button.data(`fachada_${i}_price`));
    }

    // Preview imagen
    form.find('#productImagePreview').attr('src', '/' + button.data('image_url'));

    // Cambiar texto del botón
    form.find('button[type="submit"]').text('Actualizar Producto');
});

/**
 * ===============================================================
 * Limpiar modal al cerrarlo
 * ===============================================================
 */
$('#editProductModal').on('hidden.bs.modal', function() {
    const form = $(this).find('form');
    form[0].reset();
    form.attr('action', '');
    form.find('button[type="submit"]').text('Crear Producto');
});