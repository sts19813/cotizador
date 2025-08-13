<!DOCTYPE html>
<html lang="es">
<x-head />
<link rel="stylesheet" href="/assets/resumen.css">

<body>

    <x-header />


    <div class="container py-5">
        <h2 class="fw-bold text-center mb-5">Hola, Guillermo</h2>

        <div class="row g-4">
            @foreach ($configurations as $index => $config)
                <div class="card mb-4">
                    <div class="row g-0 align-items-center">
                        <div class="col-md-6">
                            <img src="/img/minimalista.jpg" class="img-fluid rounded-4" alt="Casa render">
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
                                            <td class="text-end pe-0">{{ $config->created_at->format('d / m / Y') }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Estilo</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['Estilos']['valor'] ?? '' }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Recámaras</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['Habitaciones']['valor'] ?? '' }}</td>
                                        </tr>
                                        <tr>
                                            <th class="ps-0">Fachada</th>
                                            <td class="text-end pe-0">
                                                {{ $config->configuration['collapse-21']['valor'] ?? '' }}</td>
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
