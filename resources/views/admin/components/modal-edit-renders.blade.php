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

                <div class="modal-body row g-3">

                    <!-- Selector de fachada -->
                    <div class="col-12 mb-3">
                        <label for="fachada" class="form-label">Selecciona fachada</label>
                        <select name="fachada" id="fachada" class="form-select">
                            <option value="Fachada A">Fachada A</option>
                            <option value="Fachada B">Fachada B</option>
                            <option value="Fachada 2A">Fachada 2A</option>
                            <option value="Fachada 2B">Fachada 2B</option>
                            <option value="Fachada 3A">Fachada 3A</option>
                            <option value="Fachada 3B">Fachada 3B</option>
                            <option value="Fachada 4A">Fachada 4A</option>

                        </select>
                    </div>

                    <!-- 4 imágenes base por fachada -->
                    @for ($i = 1; $i <= 4; $i++)
                        <div class="col-md-3">
                            <label>Imagen Base {{ $i }} (Fachada)</label>
                            <input type="file" name="base_image_{{ $i }}" class="form-control">
                            <img id="preview_base_image_{{ $i }}" class="img-fluid mt-1 border" style="max-height:150px; display:none;">
                        </div>
                    @endfor

                    <hr class="my-3">

                    <!-- 9 renders generales -->
                    @for ($i = 1; $i <= 9; $i++)
                        <div class="col-md-4">
                            <label>Render {{ $i }} (General)</label>
                            <input type="file" name="image_{{ $i }}" class="form-control">
                            <img id="preview_image_{{ $i }}" class="img-fluid mt-1 border" style="max-height:150px; display:none;">
                        </div>
                    @endfor

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Guardar Renders</button>
                </div>
            </form>
        </div>
    </div>
</div>
