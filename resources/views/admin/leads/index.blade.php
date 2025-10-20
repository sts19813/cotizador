@extends('layouts.admin')

@section('content')

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Leads ({{ $leads->count() }})</h2>
    <button class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#createLeadModal">
        <i class="bi bi-plus-lg"></i> Nuevo Lead
    </button>
</div>

@if(session('success'))
    <div class="alert alert-success">{{ session('success') }}</div>
@endif

<table id="leadsTable" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Email</th>
            <th>Registrado</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach($leads as $lead)
            <tr>
                <td>{{ $lead->name }}</td>
                <td>{{ $lead->email }}</td>
                <td>{{ $lead->created_at->format('d/m/Y') }}</td>
                <td>
                    <!-- Botón Editar como icono -->
                    <a href="#" class="btn btn-sm btn-outline-primary" 
                    data-bs-toggle="modal" 
                    data-bs-target="#editLeadModal{{ $lead->id }}">
                    <i class="bi bi-pencil"></i>
                    </a>

                    <!-- Botón Eliminar como icono -->
                    <form action="{{ route('admin.leads.destroy', $lead) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-outline-danger" 
                                onclick="return confirm('¿Eliminar este lead?')">
                            <i class="bi bi-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>

            @include('admin.leads.partials.modal-edit', ['lead' => $lead])
        @endforeach
    </tbody>
</table>


@include('admin.leads.partials.modal-create')

@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        $('#leadsTable').DataTable({
            language: { url: '//cdn.datatables.net/plug-ins/2.3.2/i18n/es-MX.json' },
            responsive: true,
            dom:
            "<'row mb-3'<'col-12 d-flex justify-content-end'f>>" + // buscador arriba derecha
            "<'row'<'col-12'tr>>" +                               // tabla
            "<'row mt-3'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'p>>" 
        });
    });
</script>
@endpush
