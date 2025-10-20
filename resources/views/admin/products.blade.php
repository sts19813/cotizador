@extends('layouts.admin')

@section('content')

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
            <td><span class="badge bg-secondary">{{ $product->category->name }}</span></td>
            <td><span class="badge bg-secondary">{{ $product->style }}</span></td>
            <td>{{ $product->title }}</td>
            <td>{{ $product->brand }}</td>
            <td>${{ number_format($product->base_price, 2) }}</td>
            <td>
                <a href="#" class="btn btn-sm btn-outline-primary btn-edit-product"
                    data-id="{{ $product->id }}"
                    data-category_id="{{ $product->category_id }}"
                    data-style="{{ $product->style }}"
                    data-pre_code="{{ $product->pre_code }}"
                    data-variant_code="{{ $product->variant_code }}"
                    data-version="{{ $product->version }}"
                    data-title="{{ $product->title }}"
                    data-description="{{ $product->description }}"
                    data-brand="{{ $product->brand }}"
                    data-base_price="{{ $product->base_price }}"
                    data-image_url="{{ $product->image_url }}"
                    data-product_url="{{ $product->product_url }}"
                    data-fachada_1_price="{{ $product->fachada_1_price }}"
                    data-fachada_2_price="{{ $product->fachada_2_price }}"
                    data-fachada_3_price="{{ $product->fachada_3_price }}"
                    data-fachada_4_price="{{ $product->fachada_4_price }}"
                    data-fachada_5_price="{{ $product->fachada_5_price }}"
                    data-fachada_6_price="{{ $product->fachada_6_price }}"
                    data-fachada_7_price="{{ $product->fachada_7_price }}"
                    data-bs-toggle="modal"
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


<!-- ====================== MODAL CREAR PRODUCTO ====================== -->
<div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Nuevo Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="modal-body row g-3">
          <!-- Información básica -->
          <div class="col-md-4">
            <label>Categoría*</label>
            <select name="category_id" class="form-control" required>
              @foreach($categories as $category)
                <option value="{{ $category->id }}">{{ $category->name }}</option>
              @endforeach
            </select>
          </div>
          <div class="col-md-4">
            <label>Estilo/Concepto*</label>
            <select name="style" class="form-control" required>
              <option value="Minimalista">Minimalista</option>
              <option value="Tulum">Tulum</option>
              <option value="Mexicano">Mexicano</option>
            </select>
          </div>
          <div class="col-md-4">
            <label>Pre Código*</label>
            <input type="text" name="pre_code" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label>Código Variante*</label>
            <input type="text" name="variant_code" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label>Versión*</label>
            <input type="text" name="version" class="form-control" required>
          </div>
          <div class="col-12">
            <label>Título del Producto*</label>
            <input type="text" name="title" class="form-control" required>
          </div>
          <div class="col-12">
            <label>Descripción Completa*</label>
            <textarea name="description" class="form-control"></textarea>
          </div>
          <div class="col-md-6">
            <label>Marca/Proveedor</label>
            <input type="text" name="brand" class="form-control">
          </div>
          <div class="col-md-6">
            <label>Precio Base</label>
            <input type="number" step="0.01" name="base_price" class="form-control">
          </div>
          <div class="col-md-6">
            <label>Imagen del Producto</label>
            <input type="file" name="image_file" class="form-control">
          </div>
          <div class="col-md-6">
            <label>Archivo o Link del Producto</label>
            <input type="file" name="product_file" class="form-control">
          </div>

          <!-- Precios por Fachadas -->
          <div class="col-12"><label class="fw-bold">Precios por Fachadas*</label></div>
          @for($i=1; $i<=7; $i++)
          <div class="col-md-3">
            <input type="number" step="0.01" name="fachada_{{ $i }}_price" class="form-control" placeholder="Fachada {{ $i }}" required>
          </div>
          @endfor
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-dark">Crear Producto</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- ====================== MODAL EDITAR PRODUCTO ====================== -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title">Editar Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <form id="editForm" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="modal-body row g-3">
          <!-- Información básica -->
          <div class="col-md-4">
            <label>Categoría*</label>
            <select name="category_id" class="form-control" required>
              @foreach($categories as $category)
                <option value="{{ $category->id }}">{{ $category->name }}</option>
              @endforeach
            </select>
          </div>
          <div class="col-md-4">
            <label>Estilo/Concepto*</label>
            <select name="style" class="form-control" required>
              <option value="Minimalista">Minimalista</option>
              <option value="Tulum">Tulum</option>
              <option value="Mexicano">Mexicano</option>
            </select>
          </div>
          <div class="col-md-4">
            <label>Pre Código*</label>
            <input type="text" name="pre_code" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label>Código Variante*</label>
            <input type="text" name="variant_code" class="form-control" required>
          </div>
          <div class="col-md-6">
            <label>Versión*</label>
            <input type="text" name="version" class="form-control" required>
          </div>
          <div class="col-12">
            <label>Título del Producto*</label>
            <input type="text" name="title" class="form-control" required>
          </div>
          <div class="col-12">
            <label>Descripción Completa*</label>
            <textarea name="description" class="form-control"></textarea>
          </div>
          <div class="col-md-6">
            <label>Marca/Proveedor</label>
            <input type="text" name="brand" class="form-control">
          </div>
          <div class="col-md-6">
            <label>Precio Base</label>
            <input type="number" step="0.01" name="base_price" class="form-control">
          </div>

          <img id="productImagePreview" src="" class="img-fluid mb-2" style="max-width: 150px;">

          <div class="col-md-6">
            <label>Imagen del Producto</label>
            <input type="file" name="image_file" class="form-control">
          </div>
          <div class="col-md-6">
            <label>Archivo o Link del Producto</label>
            <input type="file" name="product_file" class="form-control">
          </div>

          <!-- Precios por Fachadas -->
          <div class="col-12"><label class="fw-bold">Precios por Fachadas*</label></div>
          @for($i=1; $i<=7; $i++)
          <div class="col-md-3">
            <input type="number" step="0.01" name="fachada_{{ $i }}_price" class="form-control" placeholder="Fachada {{ $i }}" required>
          </div>
          @endfor
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-dark">Actualizar Producto</button>
        </div>
      </form>
    </div>
  </div>
</div>

@endsection

@push('scripts')

<script src="{{ asset('productos.js') }}"></script>

@endpush
