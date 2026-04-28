@extends('layouts.admin')

@section('title', 'Zonas')

@section('content')
<div class="d-flex flex-column flex-column-fluid">
    <div class="d-flex justify-content-between align-items-center mb-5">
        <div>
            <h1 class="fw-bold text-gray-800">
                <i class="ki-outline ki-geolocation fs-2 me-2 text-primary"></i>
                Catálogo de Zonas
            </h1>
            <span class="text-muted fs-7">Gestiona zonas y su relación con desarrollos</span>
        </div>
    </div>

    @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card mb-5">
        <div class="card-header">
            <h3 class="card-title">Nueva Zona</h3>
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('admin.zones.store') }}" class="row g-4">
                @csrf
                <div class="col-md-4">
                    <label class="form-label">Nombre</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label class="form-label">Imagen</label>
                    <input type="text" name="image_url" class="form-control" placeholder="/img/tulum.jpg">
                </div>
                <div class="col-md-2">
                    <label class="form-label">Orden</label>
                    <input type="number" name="order" min="0" class="form-control" value="0">
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <label class="form-check form-switch mb-0">
                        <input class="form-check-input" type="checkbox" name="is_active" value="1" checked>
                        <span class="form-check-label ms-2">Activa</span>
                    </label>
                </div>

                <div class="col-12">
                    <label class="form-label d-block">Desarrollos</label>
                    <div class="row g-2">
                        @foreach ($developmentCatalog as $developmentId => $developmentName)
                            <div class="col-md-3 col-sm-6">
                                <label class="form-check form-check-sm form-check-custom form-check-solid">
                                    <input class="form-check-input" type="checkbox" name="development_ids[]" value="{{ $developmentId }}">
                                    <span class="form-check-label">{{ $developmentName }} ({{ $developmentId }})</span>
                                </label>
                            </div>
                        @endforeach
                    </div>
                </div>

                <div class="col-12 text-end">
                    <button class="btn btn-primary">Crear zona</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row g-5">
        @foreach ($zones as $zone)
            @php
                $zoneDevelopmentIds = $zone->developments->pluck('development_id')->map(fn($id) => (int) $id)->all();
                $developmentOptions = collect($developmentCatalog)
                    ->mapWithKeys(fn($name, $id) => [(int) $id => $name])
                    ->toArray();

                foreach ($zone->developments as $zoneDevelopment) {
                    if (!array_key_exists((int) $zoneDevelopment->development_id, $developmentOptions)) {
                        $developmentOptions[(int) $zoneDevelopment->development_id] = $zoneDevelopment->development_name;
                    }
                }

                ksort($developmentOptions);
            @endphp

            <div class="col-12">
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h3 class="card-title mb-0">{{ $zone->name }}</h3>
                        <span class="badge {{ $zone->is_active ? 'badge-light-success' : 'badge-light-secondary' }}">
                            {{ $zone->is_active ? 'Activa' : 'Inactiva' }}
                        </span>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('admin.zones.update', $zone) }}" class="row g-4 mb-4">
                            @csrf
                            @method('PUT')

                            <div class="col-md-4">
                                <label class="form-label">Nombre</label>
                                <input type="text" name="name" class="form-control" value="{{ $zone->name }}" required>
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Imagen</label>
                                <input type="text" name="image_url" class="form-control" value="{{ $zone->image_url }}" placeholder="/img/tulum.jpg">
                            </div>
                            <div class="col-md-2">
                                <label class="form-label">Orden</label>
                                <input type="number" name="order" min="0" class="form-control" value="{{ $zone->order }}">
                            </div>
                            <div class="col-md-2 d-flex align-items-end">
                                <label class="form-check form-switch mb-0">
                                    <input class="form-check-input" type="checkbox" name="is_active" value="1" {{ $zone->is_active ? 'checked' : '' }}>
                                    <span class="form-check-label ms-2">Activa</span>
                                </label>
                            </div>

                            <div class="col-12">
                                <label class="form-label d-block">Desarrollos</label>
                                <div class="row g-2">
                                    @foreach ($developmentOptions as $developmentId => $developmentName)
                                        <div class="col-md-3 col-sm-6">
                                            <label class="form-check form-check-sm form-check-custom form-check-solid">
                                                <input class="form-check-input" type="checkbox" name="development_ids[]" value="{{ $developmentId }}" {{ in_array((int) $developmentId, $zoneDevelopmentIds, true) ? 'checked' : '' }}>
                                                <span class="form-check-label">{{ $developmentName }} ({{ $developmentId }})</span>
                                            </label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>

                            <div class="col-12 d-flex justify-content-between">
                                <button class="btn btn-primary">Guardar zona</button>
                                <button type="submit" form="delete-zone-{{ $zone->id }}" class="btn btn-danger">Eliminar zona</button>
                            </div>
                        </form>

                        <form id="delete-zone-{{ $zone->id }}" method="POST" action="{{ route('admin.zones.destroy', $zone) }}" onsubmit="return confirm('¿Eliminar zona?')">
                            @csrf
                            @method('DELETE')
                        </form>

                        <div class="border rounded p-3">
                            <h5 class="mb-3">Agregar desarrollo</h5>
                            <form method="POST" action="{{ route('admin.zones.developments.store', $zone) }}" class="row g-2">
                                @csrf
                                <div class="col-md-3">
                                    <input type="number" name="development_id" class="form-control" placeholder="ID" min="1" required>
                                </div>
                                <div class="col-md-6">
                                    <input type="text" name="development_name" class="form-control" placeholder="Nombre (opcional)">
                                </div>
                                <div class="col-md-3">
                                    <button class="btn btn-light-primary w-100">Agregar</button>
                                </div>
                            </form>
                        </div>

                        <div class="mt-4">
                            <h5 class="mb-2">Desarrollos asignados</h5>
                            <div class="d-flex flex-wrap gap-2">
                                @forelse ($zone->developments as $development)
                                    <form method="POST" action="{{ route('admin.zones.developments.destroy', [$zone, $development]) }}" onsubmit="return confirm('¿Quitar desarrollo de esta zona?')">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-sm btn-light-danger" type="submit">
                                            {{ $development->development_name }} ({{ $development->development_id }})
                                        </button>
                                    </form>
                                @empty
                                    <span class="text-muted">Sin desarrollos</span>
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
@endsection
