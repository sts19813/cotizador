@extends('layouts.admin')

@section('content')
<div class="container py-4">
    <h2>Nueva Categoría</h2>

    <form action="{{ route('admin.categories.store') }}" method="POST" class="mt-4">
        @csrf

        <div class="mb-3">
            <label for="name" class="form-label">Nombre*</label>
            <input type="text" name="name" id="name" class="form-control" required value="{{ old('name') }}">
            @error('name')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <div class="mb-3">
            <label for="orden" class="form-label">Orden</label>
            <input type="number" name="orden" id="orden" class="form-control" value="{{ old('orden', 0) }}">
            @error('orden')
                <small class="text-danger">{{ $message }}</small>
            @enderror
        </div>

        <button type="submit" class="btn btn-dark">Crear Categoría</button>
        <a href="{{ route('admin.categories.index') }}" class="btn btn-secondary">Cancelar</a>
    </form>
</div>
@endsection
