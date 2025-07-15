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
            @foreach ($configurations as $config)
                <tr>
                    <td>#{{ $config->id }}</td>
                    <td>{{ $config->user->name }}</td>
                    <td>
                        {{ count($config->configuration) }} items
                        <br>
                        @foreach (array_slice($config->configuration, 0, 3) as $item)
                            <span class="badge bg-secondary">{{ $item['variant_code'] ?? '' }}</span>
                        @endforeach
                        @if (count($config->configuration) > 3)
                            <span class="badge bg-light">+{{ count($config->configuration) - 3 }}</span>
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
</div>
@endsection
