<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="createProductLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content p-3">
      <div class="modal-header">
        <h5 class="modal-title" id="createProductLabel">Editar Producto</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <form id="editForm" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="modal-body row g-3">
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
            <textarea name="description" class="form-control" ></textarea>
          </div>
          <div class="col-md-6">
            <label>Marca/Proveedor</label>
            <input type="text" name="brand" class="form-control" >
          </div>
          <div class="col-md-6">
            <label>Precio Base</label>
            <input type="number" step="0.01" name="base_price" class="form-control" >
          </div>

          <img id="productImagePreview" src="" class="img-fluid mb-2" style="max-width: 150px;">

          <!-- Para subir archivo -->
          <div class="col-md-6">
            <label>Imagen del Producto*</label>
            <input type="file" name="image_file" class="form-control">
          </div>

          <!-- Para subir un archivo adicional (si `product_url` también es archivo, como un PDF o imagen) -->
          <div class="col-md-6">
            <label>Archivo o Link del Producto</label>
            <input type="file" name="product_file" class="form-control">
          </div>

          <div class="col-12">
            <label class="fw-bold">Precios por Tamaño de Casa*</label>
          </div>
          <div class="col-md-3"><input type="number" name="one_bedroom_price" class="form-control" placeholder="1 Recámara" required></div>
          <div class="col-md-3"><input type="number" name="two_bedroom_price" class="form-control" placeholder="2 Recámaras" required></div>
          <div class="col-md-3"><input type="number" name="three_bedroom_price" class="form-control" placeholder="3 Recámaras" required></div>
          <div class="col-md-3"><input type="number" name="four_bedroom_price" class="form-control" placeholder="4 Recámaras" required></div>
        </div>

        <div class="modal-footer">
          <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-dark">Crear Producto</button>
        </div>
      </form>
    </div>
  </div>
</div>