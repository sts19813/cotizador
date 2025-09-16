<!-- Modal para editar renders del producto -->
<div class="modal fade" id="editRendersModal" tabindex="-1" aria-labelledby="editRendersLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content p-3">
            <div class="modal-header">
                <h5 class="modal-title" id="editRendersLabel">Editar Renders del Producto</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form id="renderForm" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <input type="hidden" name="product_id" id="renderProductId">

                <div class="modal-body">

                    <!-- Tabla de fachadas y sus 4 imágenes -->
                    <table class="table table-bordered mb-4">
                        <thead>
                            <tr>
                                <th>Fachada</th>
                                <th>Frente</th>
                                <th>Izquierda</th>
                                <th>Derecha</th>
                                <th>Atrás</th>
                            </tr>
                        </thead>
                        <tbody id="fachadasTableBody">
                            <!-- El contenido se llenará dinámicamente con JS al abrir el modal -->
                        </tbody>
                    </table>

                    <hr>

                    <!-- 9 renders generales -->
                    <div class="row g-3">
                        @for ($i = 1; $i <= 9; $i++)
                            <div class="col-md-4">
                                <label>Render {{ $i }} (General)</label>
                                <input type="file" name="image_{{ $i }}" class="form-control mb-1">
                                <img id="preview_image_{{ $i }}" class="img-fluid border" style="max-height:100px; display:none;">
                            </div>
                        @endfor
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Guardar Renders</button>
                </div>
            </form>
        </div>
    </div>
</div>

@push('scripts')
<script>
$(document).on('click', '.btn-edit-renders', function() {
    const button = $(this);
    const form = $('#renderForm');
    const productId = button.data('id');

    form.attr('action', `/admin/renders/${productId}`);
    form.find('#renderProductId').val(productId);

    // --- Fachadas ---
    const fachadasData = button.data('fachadas') || {};
    const defaultFachadas = ['Fachada A','Fachada B','Fachada 2A','Fachada 2B','Fachada 3A','Fachada 3B','Fachada 4A'];
    const tbody = $('#fachadasTableBody');
    tbody.empty();

    defaultFachadas.forEach(fachada => {
        const renderFachada = fachadasData[fachada] || {};
        let row = `<tr>
            <td>${fachada}</td>`;
        for(let i=1; i<=4; i++){
            const imgUrl = renderFachada[`base_image_${i}`] || '';
            row += `<td>
                        <input type="file" name="fachadas[${fachada}][base_image_${i}]" class="form-control mb-1">
                        ${imgUrl ? `<img src="${imgUrl}" class="img-fluid border" style="max-height:100px;">` : ''}
                    </td>`;
        }
        row += `</tr>`;
        tbody.append(row);
    });

    // --- Renders generales ---
    for(let i=1; i<=9; i++){
        const imageUrl = button.data(`image_${i}`);
        const preview = $(`#preview_image_${i}`);
        if(imageUrl) preview.attr('src', imageUrl).show();
        else preview.hide();
    }
});
</script>
@endpush
