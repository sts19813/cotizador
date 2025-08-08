@extends('layouts.admin')

@section('content')
<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
            <h2>Administrador de render</h2>
            <p class="text-muted">Carga los renders por producto</p>
        </div>

    </div>

    <table id="productsTable" class="table table-striped">
        <thead>
            <tr>
                <th>Imagen</th>
                <th>Código Variante</th>
                <th>Categoría</th>
                <th>Estilo/Concepto</th>
                <th>Nombre</th>
                <th>Marca/Proveedor</th>
                <th>Precio Base</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
            <tr>
                <td><img src="/{{ $product->image_url }}" width="50" class="rounded"></td>
                <td>{{ $product->variant_code }}</td>
                <td><span class="badge bg-dark">{{ $product->category->name }}</span></td>
                <td><span class="badge bg-secondary">{{ $product->style }}</span></td>
                <td>{{ $product->title }}</td>
                <td>{{ $product->brand }}</td>
                <td>${{ number_format($product->base_price, 2) }}</td>
                <td>
                    <a href="#" class="btn btn-sm btn-outline-secondary"><i class="bi bi-eye"></i></a>
                    <a href="#" class="btn btn-sm btn-outline-warning btn-edit-renders"
                        data-id="{{ $product->id }}"
                        @if($product->renders)
                        @for($i = 1; $i <= 9; $i++)
                            data-image_{{ $i }}="{{ $product->renders->{'image_'.$i} }}"
                            @endfor
                            @endif
                            data-bs-toggle="modal" data-bs-target="#editRendersModal">
                            <i class="bi bi-layers"></i>
                    </a>

                    <form action="{{ route('admin.products.destroy', $product) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger"
                            onclick="return confirm('¿Eliminar este producto?')">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@include('admin.components.modal-edit-renders')
@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        $('#productsTable').DataTable({
            autoWidth: false,
            columnDefs: [{
                    width: '360px',
                    targets: 4
                },
                {
                    width: '100px',
                    targets: 7
                }
            ],
            language: {
                url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json'
            },
            responsive: true
        });
    });
</script>
<script>
$(document).on('click', '.btn-edit-renders', function() {
    const button = $(this);
    const form = $('#renderForm');

    const productId = button.data('id');
form.attr('action', `/admin/renders/${productId}`);
    form.find('#renderProductId').val(productId);

    for (let i = 1; i <= 9; i++) {
        const imageUrl = button.data(`image_${i}`);
        const preview = $(`#preview_image_${i}`);
        if (imageUrl) {
            preview.attr('src',  imageUrl).show();
        } else {
            preview.hide();
        }
    }
});
</script>
@endpush