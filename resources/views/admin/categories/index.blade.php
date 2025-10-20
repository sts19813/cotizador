@extends('layouts.admin')

@section('content')

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Categorías</h2>
    <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#createCategoryModal">
        <i class="bi bi-plus-lg"></i> Nueva Categoría
    </button>
</div>

{{-- Mensaje de éxito --}}
@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

{{-- ======== TABLAS EN FILA ======== --}}
<div class="row">
    @foreach($categoriesByStyle as $style => $categories)
    <div class="col-md-4 mb-4">
        <div class="card h-100">
            <div class="card-header bg-dark text-white d-flex justify-content-between align-items-center">
                <span>{{ $style }}</span>
                <button class="btn btn-light btn-sm save-order" data-style="{{ $style }}">Guardar Orden</button>
            </div>
            <div class="card-body p-0">
                <table class="table table-striped mb-0 table-sm sortable-table" data-style="{{ $style }}">
                    <thead class="table-light">
                        <tr>
                            <th style="padding: 10px">Orden</th>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="sortable">
                        @foreach($categories as $category)
                        <tr data-id="{{ $category->id }}">
                            <td style="padding-left: 30px" class="align-middle text-muted">{{ $category->orden }}</td>
                            <td class="align-middle">{{ $category->name }}</td>
                            <td class="align-middle" style="width: 120px">
                                <button class="btn btn-sm btn-outline-primary btn-edit-category"
                                    data-id="{{ $category->id }}"
                                    data-name="{{ $category->name }}"
                                    data-orden="{{ $category->orden }}"
                                    data-style="{{ $category->style }}"
                                    data-active="{{ $category->is_active ? 1 : 0 }}"
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
        </div>
    </div>
    @endforeach
</div>


{{-- ======================
    MODAL: CREAR CATEGORÍA
====================== --}}
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
                    <div class="mb-3">
                        <label class="form-label">Nombre*</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Estilo*</label>
                        <select name="style" class="form-select" required>
                            <option value="Minimalista">Minimalista</option>
                            <option value="Tulum">Tulum</option>
                            <option value="Mexicano">Mexicano</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Orden</label>
                        <input type="number" name="orden" class="form-control" value="0">
                    </div>

                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="is_active" checked>
                        <label class="form-check-label">Activo</label>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-dark">Crear Categoría</button>
                </div>
            </form>
        </div>
    </div>
</div>

{{-- ======================
    MODAL: EDITAR CATEGORÍA
====================== --}}
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
                    <div class="mb-3">
                        <label class="form-label">Nombre*</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Estilo*</label>
                        <select name="style" class="form-select" required>
                            <option value="Minimalista">Minimalista</option>
                            <option value="Tulum">Tulum</option>
                            <option value="Mexicano">Mexicano</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Orden</label>
                        <input type="number" name="orden" class="form-control">
                    </div>

                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="is_active">
                        <label class="form-check-label">Activo</label>
                    </div>
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
<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>
<script src="{{ asset('categories.js') }}"></script>
@endpush
