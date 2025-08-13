@extends('layouts.admin')

@section('content')
    <div class="container">
        <h2>Casas Creadas</h2>
        <p class="text-muted">Visualiza todas las casas creadas por los leads</p>

        <table class="table">
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
                            <ul class="list-unstyled mb-0">
                                @foreach ($config->configuration as $item)
                                    <li>
                                        <strong>{{ $item['categoria'] ?? '' }}:</strong>
                                        {{ $item['valor'] ?? '' }}
                                    </li>
                                @endforeach
                            </ul>
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
    </div>
@endsection
