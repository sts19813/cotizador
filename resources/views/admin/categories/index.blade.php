@extends('layouts.admin')

@section('content')
<div class="container py-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Categorías</h2>
        <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#createCategoryModal">
            <i class="bi bi-plus-lg"></i> Nueva Categoría
        </button>
    </div>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <table class="table table-striped" id="categoriesTable">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Orden</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            @foreach($categories as $category)
            <tr>
                <td>{{ $category->name }}</td>
                <td>{{ $category->orden }}</td>
                <td>
                    <button class="btn btn-sm btn-outline-primary btn-edit-category"
                        data-id="{{ $category->id }}"
                        data-name="{{ $category->name }}"
                        data-orden="{{ $category->orden }}"
                        data-bs-toggle="modal" data-bs-target="#editCategoryModal">
                        <i class="bi bi-pencil"></i>
                    </button>
                    <form action="{{ route('admin.categories.destroy', $category) }}" method="POST" class="d-inline" onsubmit="return confirm('¿Eliminar esta categoría?')">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash"></i></button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<!-- Modal Crear -->
<div class="modal fade" id="createCategoryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-3">
            <div class="modal-header">
                <h5 class="modal-title">Nueva Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form action="{{ route('admin.categories.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <label>Nombre*</label>
                    <input type="text" name="name" class="form-control" required>
                    <label class="mt-3">Orden</label>
                    <input type="number" name="orden" class="form-control" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Crear Categoría</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal Editar -->
<div class="modal fade" id="editCategoryModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content p-3">
            <div class="modal-header">
                <h5 class="modal-title">Editar Categoría</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="editCategoryForm" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <label>Nombre*</label>
                    <input type="text" name="name" class="form-control" required>
                    <label class="mt-3">Orden</label>
                    <input type="number" name="orden" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Actualizar Categoría</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const editModal = document.getElementById('editCategoryModal');
        const editForm = document.getElementById('editCategoryForm');

        document.querySelectorAll('.btn-edit-category').forEach(button => {
            button.addEventListener('click', function () {
                const id = this.dataset.id;
                const name = this.dataset.name;
                const orden = this.dataset.orden;

                // Cambiar action del form para update
                editForm.action = `/admin/categories/${id}`;

                // Rellenar inputs
                editForm.querySelector('[name="name"]').value = name;
                editForm.querySelector('[name="orden"]').value = orden;
            });
        });

        // Opcional: limpiar formulario al cerrar modal
        editModal.addEventListener('hidden.bs.modal', function () {
            editForm.reset();
            editForm.action = '';
        });
    });
</script>
@endpush
