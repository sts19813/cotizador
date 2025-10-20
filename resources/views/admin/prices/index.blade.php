@extends('layouts.admin')

@section('content')
<div class="container mt-4">
    <h3 class="mb-4">Precios - {{ $style }}</h3>

    <!-- Botones Exportar e Importar -->
    <div class="mb-3 d-flex justify-content-between">
        <button id="exportBtn" class="btn btn-primary">
            <i class="bi bi-file-earmark-excel"></i> Exportar plantilla
        </button>

        <div class="d-flex">
            <input type="file" id="importFile" class="form-control me-2" accept=".xlsx,.xls">
            <button id="importBtn" class="btn btn-success">
                <i class="bi bi-upload"></i> Importar precios
            </button>
        </div>
    </div>

    <!-- Formulario masivo -->
    <form id="massUpdateForm" action="{{ route('admin.products.update-mass', $style) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="d-flex justify-content-end mb-3">
            <button type="submit" class="btn btn-success" id="saveBtn">
                <i class="bi bi-save"></i> Guardar cambios
            </button>
        </div>

        <table class="table table-bordered table-hover align-middle" id="pricesTable">
            <thead class="table-light text-center">
                <tr>
                    <th>ID</th>
                    <th>Imagen</th>
                    <th>Producto</th>
                    @for($i = 1; $i <= 7; $i++)
                        <th>Fachada {{ $i }}</th>
                    @endfor
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $product)
                <tr>
                    <td>{{ $product->id }}</td>
                    <td class="text-center">
                        @if($product->image_url)
                            <img src="/{{ $product->image_url }}" alt="Imagen" class="img-thumbnail" style="max-width: 100px;">
                        @endif
                    </td>
                    <td>{{ $product->title }}</td>
                    
                    @for($i = 1; $i <= 7; $i++)
                        <td>
                            <input type="number" step="0.01" class="form-control" 
                                name="products[{{ $product->id }}][fachada_{{ $i }}_price]" 
                                value="{{ $product->{'fachada_'.$i.'_price'} }}">
                        </td>
                    @endfor
                </tr>
                @endforeach
            </tbody>
        </table>
    </form>
</div>

<!-- Loader overlay -->
<div id="loaderOverlay" style="
    display:none;
    position:fixed;
    top:0; left:0; right:0; bottom:0;
    background:rgba(255,255,255,0.8);
    z-index:2000;
    align-items:center;
    justify-content:center;
">
    <div class="spinner-border text-primary" style="width:3rem; height:3rem;" role="status"></div>
</div>

@endsection

@push('scripts')
    <!-- Dependencias -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

    <!-- Script externo -->
    <script src="{{ asset('/assets/js/admin/prices-mass.js') }}"></script>
@endpush
