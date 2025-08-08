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

                    @for ($i = 1; $i <= 9; $i++)
                        <div class="col-md-4">
                        <label>Render {{ $i }}</label>

                        {{-- Imagen base fija solo para los primeros 7 renders --}}
                        @if($i <= 7)
                            @php
                            $baseImages=[
                            1=> '/baseMinimalista/fachadaA/01-F.jpg',
                            2 => '/baseMinimalista/fachadaA/02-R.jpg',
                            3 => '/baseMinimalista/fachadaA/03L.jpg',
                            4 => '/baseMinimalista/fachadaA/04-B.jpg',
                            5 => '/baseMinimalista/MINIMALISTA-SALA-BASE.jpg',
                            6 => '/baseMinimalista/MINIMALISTA-COCINA-BASE.jpg',
                            7 => '/baseMinimalista/MINIMALISTA-RECAMARA-BASE.jpg',
                            ];
                            @endphp
                            <img src="{{ $baseImages[$i] }}" alt="Base Render {{ $i }}" class="img-fluid mb-1" style="max-height: 100px;">
                            @endif

                            <input type="file" name="image_{{ $i }}" class="form-control">

                            <img id="preview_image_{{ $i }}" src="" class="img-fluid mt-1" style="max-height: 150px; display: none;">
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