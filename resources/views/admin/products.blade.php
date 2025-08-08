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
                            <a href="#" class="btn btn-sm btn-outline-primary btn-edit-product"
                                data-id="{{ $product->id }}" data-category_id="{{ $product->category_id }}"
                                data-style="{{ $product->style }}" data-pre_code="{{ $product->pre_code }}"
                                data-variant_code="{{ $product->variant_code }}" data-version="{{ $product->version }}"
                                data-title="{{ $product->title }}" data-description="{{ $product->description }}" data-brand="{{ $product->brand }}"
                                data-base_price="{{ $product->base_price }}" data-image_url="{{ $product->image_url }}"
                                data-product_url="{{ $product->product_url }}"
                                data-one_bedroom_price="{{ $product->one_bedroom_price }}"
                                data-two_bedroom_price="{{ $product->two_bedroom_price }}"
                                data-three_bedroom_price="{{ $product->three_bedroom_price }}"
                                data-four_bedroom_price="{{ $product->four_bedroom_price }}" data-bs-toggle="modal"
                                data-bs-target="#editProductModal">
                                <i class="bi bi-pencil"></i>
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
    @include('admin.components.modal-edit')
    @include('admin.components.modal-create')
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
        $(document).on('click', '.btn-edit-product', function() {
            debugger
            const button = $(this);
            const modal = $('#editProductModal');
            const form = $('#editForm');

            // Confirmamos que sí está accediendo al modal de edición
            console.log('Cargando modal de edición para producto ID:', button.data('id'));

            // Actualizamos la acción del formulario
            form.attr('action', `/admin/products/${button.data('id')}`);

            // Llenamos cada campo
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
            form.find('[name="one_bedroom_price"]').val(button.data('one_bedroom_price'));
            form.find('[name="two_bedroom_price"]').val(button.data('two_bedroom_price'));
            form.find('[name="three_bedroom_price"]').val(button.data('three_bedroom_price'));
            form.find('[name="four_bedroom_price"]').val(button.data('four_bedroom_price'));
            form.find('#productImagePreview').attr('src', '/' + button.data('image_url'));

            // Cambiamos texto del botón por claridad
            form.find('button[type="submit"]').text('Actualizar Producto');
        });

        // Limpiar el modal al cerrarse
        $('#editProductModal').on('hidden.bs.modal', function() {
            const form = $(this).find('form');
            form[0].reset();
            form.attr('action', '');
            $(this).find('.modal-title').text('Editar Producto');
            form.find('button[type="submit"]').text('Crear Producto');
        });
    </script>
@endpush
