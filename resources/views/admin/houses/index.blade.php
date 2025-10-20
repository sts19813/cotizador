@extends('layouts.admin')

@section('content')

    <h2>Casas Creadas</h2>
    <p class="text-muted">Visualiza todas las casas creadas por los leads</p>

    <table id="configurationsTable" class="table table-striped table-hover table-bordered align-middle">
        <thead>
            <tr>
                <th>ID Casa</th>
                <th>Lead</th>
                <th>Items Seleccionados</th>
                <th>Total Estimado</th>
                <th>Estatus</th>
                <th>Fecha Creación</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($configurations as $index => $config)
                <tr>
                    <td>MIN{{ str_pad($index + 1, 2, '0', STR_PAD_LEFT) }}</td>
                    <td>{{ $config->user->name }}</td>
                    <td>
                        @php
                            $items = $config->configuration;
                            $maxVisible = 5;
                        @endphp

                        {{-- Mostrar los primeros 5 items --}}
                        @foreach(array_slice($items, 0, $maxVisible) as $item)
                            <span class="badge bg-light text-dark mb-1" style="font-size: 0.75rem;">
                                {{ $item['categoria'] ?? '' }}: {{ $item['valor'] ?? '' }}
                            </span>
                        @endforeach

                        {{-- Si hay más de 5 items, mostrar botón "Ver más" --}}
                        @if(count($items) > $maxVisible)
                            <a href="#" class="btn-sm" data-bs-toggle="collapse"
                                data-bs-target="#extraItems{{ $index }}" aria-expanded="false">
                                Ver más
                            </a>

                            <div class="collapse mt-1" id="extraItems{{ $index }}">
                                @foreach(array_slice($items, $maxVisible) as $item)
                                    <span class="badge bg-light text-dark mb-1" style="font-size: 0.75rem;">
                                        {{ $item['categoria'] ?? '' }}: {{ $item['valor'] ?? '' }}
                                    </span>
                                @endforeach
                            </div>
                        @endif
                    </td>
                    <td>
                        <span class="text-success fw-bold">
                            ${{ number_format(array_sum(array_column($config->configuration, 'price')), 0, '.', ',') }}
                        </span>
                    </td>
                    <td>
                        <span class="badge bg-{{ $config->status === 'Solicitada' ? 'primary' : 'secondary' }}">
                            {{ $config->status }}
                        </span>
                    </td>
                    <td><i class="bi bi-calendar"></i> {{ $config->created_at->format('d/m/Y') }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

@endsection
@push('scripts')
    <script>
        $(document).ready(function () {
            $('#configurationsTable').DataTable({
                responsive: true,
                autoWidth: false,
                language: {
                    url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json'
                },
                dom:
                    "<'row mb-3'<'col-12 d-flex justify-content-end'f>>" + // buscador arriba derecha
                    "<'row'<'col-12'tr>>" +                               // tabla
                    "<'row mt-3'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'p>>", // info y paginación
            });
        });
    </script>
@endpush