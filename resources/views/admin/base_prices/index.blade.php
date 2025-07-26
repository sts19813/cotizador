@extends('layouts.admin')

@section('content')
<div class="container">
    <h2>Administración de Precios</h2>
    <p>Gestiona precios base por estilo y precios de productos</p>

    <div class="mb-3">
        <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#modalCreate">+ Nuevo Precio Base</button>
    </div>

    <div class="row">
        @foreach($basePrices as $price)
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm p-3">
                <div class="d-flex align-items-center mb-3">
                    <img src="{{ $price->image_url }}" alt="{{ $price->style }}" width="40" height="40" class="me-2">
                    <h5 class="mb-0">{{ $price->style }}</h5>
                </div>
                <div class="fs-4 fw-bold mb-2">${{ number_format($price->price, 0, ',', ',') }}</div>
                <div class="text-muted mb-3">Precio base</div>
                <form action="{{ route('admin.precios-base.update', $price) }}" method="POST" class="mb-2">
                    @csrf
                    @method('PUT')
                    <input type="hidden" name="style" value="{{ $price->style }}">
                    <input type="number" step="0.01" name="price" class="form-control mb-2" value="{{ $price->price }}">
                    <input type="url" name="image_url" class="form-control mb-2" placeholder="URL de Imagen" value="{{ $price->image_url }}">
                    <button type="submit" class="btn btn-primary w-100">Actualizar</button>
                </form>
                <form action="{{ route('admin.precios-base.destroy', $price) }}" method="POST">
                    @csrf
                    @method('DELETE')
                    <button class="btn btn-danger w-100" onclick="return confirm('¿Eliminar este estilo?')">Eliminar</button>
                </form>
            </div>
        </div>
        @endforeach
    </div>
</div>

<!-- Modal Crear -->
<div class="modal fade" id="modalCreate" tabindex="-1">
    <div class="modal-dialog">
        <form action="{{ route('admin.precios-base.store') }}" method="POST" class="modal-content p-3">
            @csrf
            <div class="modal-header">
                <h5 class="modal-title">Nuevo Precio Base</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="text" name="style" class="form-control mb-2" placeholder="Seleccione un estilo">

                <input type="number" step="0.01" name="price" class="form-control mb-2" placeholder="Precio Base" required>
                <input type="url" name="image_url" class="form-control mb-2" placeholder="URL de Imagen">
            </div>
            <div class="modal-footer">
                <button class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                <button class="btn btn-dark" type="submit">Guardar</button>
            </div>
        </form>
    </div>
</div>
@endsection
