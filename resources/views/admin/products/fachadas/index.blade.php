@extends('layouts.admin')

@section('title', 'Productos Fachadas')
@section('content')
    <div class="d-flex flex-column flex-column-fluid">

        <!-- Encabezado estilo premium -->
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h1 class="fw-bold text-gray-800">
                    <i class="ki-outline ki-home fs-2 me-2 text-primary"></i>
                    Precios Base de Fachadas
                </h1>
                <span class="text-muted fs-7">Administración de los precios base por estilo</span>
            </div>

            <div class="d-flex align-items-center gap-2">
                <a href="{{ route('admin.dashboard') }}" class="btn btn-primary d-flex align-items-center gap-2">
                    <i class="ki-outline ki-arrow-left fs-2"></i>
                    Volver 
                </a>
            </div>
        </div>

        <!-- Contenido real -->
        <div class="card-body pt-0">

            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <table id="fachadas_table"
                   class="table table-row-bordered table-hover table-striped align-middle gy-3">
                <thead>
                    <tr class="fw-bold fs-6 text-gray-800">
                        <th>ID</th>
                        <th>Title</th>
                        <th>Style</th>
                        <th>Base Price</th>
                        <th>Image</th>
                        <th>Actualizar</th>
                    </tr>
                </thead>

                <tbody>
                    @foreach ($products as $product)
                        <tr>
                            <td>{{ $product->id }}</td>
                            <td>{{ $product->title }}</td>
                            <td>
                                <span class="badge badge-light-primary">{{ $product->style }}</span>
                            </td>

                            <td>
                                <form action="{{ route('admin.precio.fachadas.update', $product->id) }}"
                                      method="POST"
                                      class="d-flex gap-2">
                                    @csrf
                                    <input type="number"
                                           name="base_price"
                                           class="form-control form-control-sm w-150px"
                                           value="{{ $product->base_price }}"
                                           step="0.01">
                            </td>

                            <td>
                                @if($product->image_url)
                                    <img src="/{{ $product->image_url }}" width="80" class="rounded">
                                @else
                                    <span class="text-muted">No image</span>
                                @endif
                            </td>

                            <td>
                                <button class="btn btn-sm btn-primary">Guardar</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>

            </table>
        </div>
    </div>
@endsection


@push('scripts')
<script>
    $("#fachadas_table").DataTable({
        pageLength: 25,
    });
</script>
@endpush
