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
                <div class="modal-body row g-3">
                    <input type="hidden" name="product_id" id="renderProductId">

                  @foreach($baseImages as $index => $baseImage)
                        <div class="col-md-4">
                            <label>Render {{ $index + 1 }}</label>

                            {{-- Imagen base --}}
                            @if($baseImage)
                                <img src="{{ asset($baseImage) }}" 
                                    alt="Base Render {{ $index + 1 }}" 
                                    class="img-fluid mb-1" 
                                    style="max-height: 100px;">
                            @endif

                            <input type="file" name="image_{{ $index + 1 }}" class="form-control">

                            <img id="preview_image_{{ $index + 1 }}" 
                                src="" 
                                class="img-fluid mt-1" 
                                style="max-height: 150px; display: none;">
                        </div>
                    @endforeach
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Guardar Renders</button>
                </div>
            </form>
        </div>
    </div>
</div>
