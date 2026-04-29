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

        <button class="btn btn-primary d-flex align-items-center gap-2" data-bs-toggle="modal" data-bs-target="#createZoneModal">
            <i class="ki-outline ki-plus fs-2"></i>
            Nueva Zona
        </button>
    </div>

    @if (session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="card">
        <div class="card-body">
            <table id="zones_table" class="table table-row-bordered table-hover table-striped align-middle gy-3">
                <thead>
                    <tr class="fw-bold fs-6 text-gray-800">
                        <th>Zona</th>
                        <th>Imagen</th>
                        <th>Desarrollos</th>
                        <th>Orden</th>
                        <th>Activo</th>
                        <th class="text-end">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($zones as $zone)
                        @php
                            $developmentPayload = $zone->developments
                                ->map(function ($development) {
                                    return [
                                        'id' => (int) $development->development_id,
                                        'name' => $development->development_name,
                                    ];
                                })
                                ->values()
                                ->all();
                        @endphp
                        <tr>
                            <td class="fw-semibold">{{ $zone->name }}</td>
                            <td>
                                @if ($zone->image_url)
                                    <img src="{{ Str::startsWith($zone->image_url, ['http://', 'https://', '/']) ? $zone->image_url : '/' . ltrim($zone->image_url, '/') }}" alt="{{ $zone->name }}" class="rounded" style="width: 90px; height: 60px; object-fit: cover;">
                                @else
                                    <span class="text-muted">Sin imagen</span>
                                @endif
                            </td>
                            <td>
                                @forelse ($zone->developments as $development)
                                    <span class="badge badge-light-primary mb-1">{{ $development->development_name }} ({{ $development->development_id }})</span>
                                @empty
                                    <span class="text-muted">Sin desarrollos</span>
                                @endforelse
                            </td>
                            <td>{{ $zone->order }}</td>
                            <td>
                                <span class="badge {{ $zone->is_active ? 'badge-light-success' : 'badge-light-secondary' }}">
                                    {{ $zone->is_active ? 'Sí' : 'No' }}
                                </span>
                            </td>
                            <td class="text-end">
                                <button
                                    class="btn btn-sm btn-light-info js-view-zone"
                                    data-zone-name="{{ $zone->name }}"
                                    data-zone-image="{{ $zone->image_url }}"
                                    data-zone-order="{{ $zone->order }}"
                                    data-zone-active="{{ $zone->is_active ? 1 : 0 }}"
                                    data-zone-developments='@json($developmentPayload)'
                                    data-bs-toggle="modal"
                                    data-bs-target="#viewZoneModal"
                                >Ver</button>

                                <button
                                    class="btn btn-sm btn-light-primary js-edit-zone"
                                    data-zone-id="{{ $zone->id }}"
                                    data-zone-name="{{ $zone->name }}"
                                    data-zone-image="{{ $zone->image_url }}"
                                    data-zone-order="{{ $zone->order }}"
                                    data-zone-active="{{ $zone->is_active ? 1 : 0 }}"
                                    data-zone-developments='@json($developmentPayload)'
                                    data-bs-toggle="modal"
                                    data-bs-target="#editZoneModal"
                                >Editar</button>

                                <form action="{{ route('admin.zones.destroy', $zone) }}" method="POST" class="d-inline" onsubmit="return confirm('¿Eliminar esta zona?')">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-sm btn-light-danger" type="submit">Eliminar</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="createZoneModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Nueva Zona</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" action="{{ route('admin.zones.store') }}">
                @csrf
                <div class="modal-body">
                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Imagen</label>
                            <input type="text" name="image_url" class="form-control" placeholder="/assets/img/zonas/merida.jpg">
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
                    </div>

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
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" type="submit">Crear zona</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="editZoneModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Zona</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST" id="editZoneForm">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <div class="row g-3 mb-3">
                        <div class="col-md-4">
                            <label class="form-label">Nombre</label>
                            <input type="text" name="name" id="edit_zone_name" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label class="form-label">Imagen</label>
                            <input type="text" name="image_url" id="edit_zone_image" class="form-control">
                        </div>
                        <div class="col-md-2">
                            <label class="form-label">Orden</label>
                            <input type="number" name="order" min="0" id="edit_zone_order" class="form-control">
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <label class="form-check form-switch mb-0">
                                <input class="form-check-input" type="checkbox" name="is_active" value="1" id="edit_zone_active">
                                <span class="form-check-label ms-2">Activa</span>
                            </label>
                        </div>
                    </div>

                    <label class="form-label d-block">Desarrollos</label>
                    <div class="row g-2" id="edit_zone_developments"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" type="submit">Guardar cambios</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="viewZoneModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Detalle de Zona</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-4 align-items-start">
                    <div class="col-md-4">
                        <img id="view_zone_image" src="" class="img-fluid rounded" style="width: 100%; height: 170px; object-fit: cover;" alt="Zona">
                    </div>
                    <div class="col-md-8">
                        <div class="mb-2"><strong>Zona:</strong> <span id="view_zone_name"></span></div>
                        <div class="mb-2"><strong>Orden:</strong> <span id="view_zone_order"></span></div>
                        <div class="mb-3"><strong>Activo:</strong> <span id="view_zone_active"></span></div>
                        <div><strong>Desarrollos:</strong></div>
                        <div id="view_zone_developments" class="d-flex flex-wrap gap-2 mt-2"></div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>


  <div class="border rounded p-3 d-none">
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
@endsection

@push('scripts')
<script>
    const developmentCatalog = @json($developmentCatalog);

    $("#zones_table").DataTable({
        pageLength: 25,
    });

    function renderDevelopmentCheckboxes(targetId, selectedDevelopmentIds) {
        const container = document.getElementById(targetId);
        if (!container) return;

        container.innerHTML = '';

        Object.entries(developmentCatalog).forEach(([id, name]) => {
            const col = document.createElement('div');
            col.className = 'col-md-3 col-sm-6';

            const checked = selectedDevelopmentIds.includes(Number(id)) ? 'checked' : '';
            col.innerHTML = `
                <label class="form-check form-check-sm form-check-custom form-check-solid">
                    <input class="form-check-input" type="checkbox" name="development_ids[]" value="${id}" ${checked}>
                    <span class="form-check-label">${name} (${id})</span>
                </label>
            `;

            container.appendChild(col);
        });
    }

    document.querySelectorAll('.js-edit-zone').forEach(button => {
        button.addEventListener('click', () => {
            const zoneId = button.dataset.zoneId;
            const zoneName = button.dataset.zoneName || '';
            const zoneImage = button.dataset.zoneImage || '';
            const zoneOrder = button.dataset.zoneOrder || '0';
            const zoneActive = Number(button.dataset.zoneActive || 0) === 1;
            const developments = JSON.parse(button.dataset.zoneDevelopments || '[]');
            const selectedIds = developments.map(item => Number(item.id));

            const form = document.getElementById('editZoneForm');
            form.action = `/admin/zones/${zoneId}`;

            document.getElementById('edit_zone_name').value = zoneName;
            document.getElementById('edit_zone_image').value = zoneImage;
            document.getElementById('edit_zone_order').value = zoneOrder;
            document.getElementById('edit_zone_active').checked = zoneActive;

            renderDevelopmentCheckboxes('edit_zone_developments', selectedIds);
        });
    });

    document.querySelectorAll('.js-view-zone').forEach(button => {
        button.addEventListener('click', () => {
            const zoneName = button.dataset.zoneName || '';
            const zoneImage = button.dataset.zoneImage || '';
            const zoneOrder = button.dataset.zoneOrder || '0';
            const zoneActive = Number(button.dataset.zoneActive || 0) === 1;
            const developments = JSON.parse(button.dataset.zoneDevelopments || '[]');

            const imageEl = document.getElementById('view_zone_image');
            imageEl.src = zoneImage ? (zoneImage.startsWith('http') || zoneImage.startsWith('/') ? zoneImage : '/' + zoneImage.replace(/^\/+/, '')) : '/img/tulum.jpg';

            document.getElementById('view_zone_name').textContent = zoneName;
            document.getElementById('view_zone_order').textContent = zoneOrder;
            document.getElementById('view_zone_active').textContent = zoneActive ? 'Sí' : 'No';

            const container = document.getElementById('view_zone_developments');
            container.innerHTML = '';
            if (!developments.length) {
                container.innerHTML = '<span class="text-muted">Sin desarrollos</span>';
                return;
            }

            developments.forEach(item => {
                const badge = document.createElement('span');
                badge.className = 'badge badge-light-primary';
                badge.textContent = `${item.name} (${item.id})`;
                container.appendChild(badge);
            });
        });
    });
</script>
@endpush
