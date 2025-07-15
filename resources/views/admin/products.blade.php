@extends('layouts.admin')

@section('content')
<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <div>
            <h2>Productos</h2>
            <p class="text-muted">Administra todos los productos disponibles para personalización</p>
        </div>
        <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#createProductModal">
            <i class="bi bi-plus-lg"></i> Nuevo Producto
        </button>
    </div>

    <table id="productsTable" class="table table-striped">
        <thead>
            <tr>
                <th>Imagen</th>
                <th>Código Variante</th>
                <th>Categoría</th>
                <th>Estilo/Concepto</th>
                <th>Descripción</th>
                <th>Marca/Proveedor</th>
                <th>Precio Base</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($products as $product)
            <tr>
                <td><img src="{{ $product->image_url }}" width="50" class="rounded"></td>
                <td>{{ $product->variant_code }}</td>
                <td><span class="badge bg-dark">{{ $product->category->name }}</span></td>
                <td><span class="badge bg-secondary">{{ $product->style }}</span></td>
                <td>{{ Str::limit($product->description, 30, '...') }}</td>
                <td>{{ $product->brand }}</td>
                <td>${{ number_format($product->base_price, 2) }}</td>
                <td>
                    <a href="#" class="btn btn-sm btn-outline-secondary"><i class="bi bi-eye"></i></a>
                    <a href="#" class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i></a>
                    <form action="{{ route('admin.products.destroy', $product) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('¿Eliminar este producto?')">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

@include('admin.components.modal-create')
@endsection

@push('scripts')
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#productsTable').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json'
            },
            responsive: true
        });
    });
</script>
@endpush
