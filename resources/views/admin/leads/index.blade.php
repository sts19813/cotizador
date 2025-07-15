@extends('layouts.admin')

@section('content')
<div class="container py-4">
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
                        <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editLeadModal{{ $lead->id }}">Editar</button>

                        <form action="{{ route('admin.leads.destroy', $lead) }}" method="POST" class="d-inline">
                            @csrf @method('DELETE')
                            <button class="btn btn-sm btn-danger">Eliminar</button>
                        </form>
                    </td>
                </tr>

                @include('admin.leads.partials.modal-edit', ['lead' => $lead])
            @endforeach
        </tbody>
    </table>
</div>

@include('admin.leads.partials.modal-create')

@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        $('#leadsTable').DataTable();
    });
</script>
@endpush
