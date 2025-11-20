<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

    <x-header />

    <div class="container py-5">

        <br><br><br>

        <h2 class="fw-bold text-center mb-5">Hola,  {{ Auth::user()->name }}</h2>

        <div class="row g-4">
            @foreach ($configurations as $index => $config)
                <div class="card mb-4">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-6">
                            <div id="principalRender{{ $index }}" class="imagen-casa animar-subida">
                                @php
                                    $miniaturas = $config->miniaturas_data ?? [];
                                    $item = $miniaturas[1] ?? null; // segunda miniatura
                                @endphp

                                @if ($item)
                                    <div style="position: relative; width: 100%; height: auto;">
                                        {{-- Imagen base --}}
                                        <img src="{{ $item['base'] }}" class="img-fluid rounded-4" style="width:100%; display:block;">
                                        
                                        {{-- Overlays --}}
                                        @if (!empty($item['overlays']))
                                            @foreach ($item['overlays'] as $overlay)
                                                <img src="{{ $overlay }}" style="position:absolute; top:0; left:0; width:100%; height:100%; pointer-events:none;">
                                            @endforeach
                                        @endif
                                    </div>
                                @else
                                    {{-- fallback --}}
                                    <img src="/img/minimalista.jpg" class="img-fluid rounded-4" alt="Casa render">
                                @endif
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card-body">
                                <table class="table table-borderless mb-0">
                                    <tbody>
                                        <tr>
                                            <th class="ps-0" style="width: 40%;">Folio</th>
                                            <td class="text-end pe-0">#{{ $config->id }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Fecha de Creación</th>
                                            <td class="text-end pe-0">{{ $config->created_at->format('d/m/Y h:i A') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Estilo</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['opciones-casas']['valor'] ?? '' }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Recámaras</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['Habitaciones']['valor'] ?? '' }}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- Botón Ver más -->
                                <button class="btn btn-link p-0 mt-2" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#verMas{{ $index }}">
                                    Ver más
                                </button>
                                <div class="collapse mt-3" id="verMas{{ $index }}">
                                    <table class="table table-sm">
                                        <thead>
                                            <tr>
                                                <th>Categoría</th>
                                                <th>Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($config->configuration as $key => $item)
                                                @if (!in_array($key, ['Estilos', 'Habitaciones', 'collapse-21']))
                                                    <tr>
                                                        <td>{{ $item['categoria'] ?? $key }}</td>
                                                        <td>{{ $item['valor'] ?? '' }}</td>
                                                    </tr>
                                                @endif
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
    <x-footer />
    <x-scripts />

</body>
</html>
