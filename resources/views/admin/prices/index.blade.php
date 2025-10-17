@extends('layouts.admin')

@section('content')
<div class="container mt-4">
    <h3 class="mb-4">Precios - {{ $style }}</h3>

    <!-- Botones Exportar e Importar (fuera del form) -->
    <div class="mb-3 d-flex justify-content-between">
        <button id="exportBtn" class="btn btn-primary">
            <i class="bi bi-file-earmark-excel"></i> Exportar plantilla
        </button>

        <div class="d-flex">
            <input type="file" id="importFile" class="form-control me-2" accept=".xlsx,.xls">
            <button id="importBtn" class="btn btn-success">
                <i class="bi bi-upload"></i> Importar precios
            </button>
        </div>
    </div>

    <!-- Formulario masivo -->
    <form action="{{ route('admin.products.update-mass', $style) }}" method="POST">
        @csrf
        @method('PUT')

    <!-- tus inputs de precios -->
    <button type="submit" class="btn btn-success">Guardar cambios</button>

        <table class="table table-bordered table-hover align-middle" id="pricesTable">
            <thead class="table-light text-center">
                <tr>
                    <th>ID</th>
                    <th>Imagen</th>
                    <th>Producto</th>
                    @for($i = 1; $i <= 7; $i++)
                        <th>Fachada {{ $i }}</th>
                    @endfor
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $product)
                <tr>
                    <td>{{ $product->id }}</td>
                    <td class="text-center">
                        @if($product->image_url)
                            <img src="/{{ $product->image_url }}" alt="Imagen" class="img-thumbnail" style="max-width: 100px;">
                        @endif
                    </td>
                    <td>{{ $product->title }}</td>
                    
                    @for($i = 1; $i <= 7; $i++)
                        <td>
                            <input type="number" step="0.01" class="form-control" 
                                name="products[{{ $product->id }}][fachada_{{ $i }}_price]" 
                                value="{{ $product->{'fachada_'.$i.'_price'} }}">
                        </td>
                    @endfor
                </tr>
                @endforeach
            </tbody>
        </table>
    </form>
</div>

<!-- XLSX JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script>
document.getElementById('exportBtn').addEventListener('click', () => {
    const table = document.getElementById('pricesTable');
    const wb = XLSX.utils.table_to_book(table, {sheet:"Precios"});
    XLSX.writeFile(wb, "plantilla_precios_{{ $style }}.xlsx");
});

document.getElementById('importBtn').addEventListener('click', () => {
    const fileInput = document.getElementById('importFile');
    if(!fileInput.files.length) {
        alert("Selecciona un archivo primero");
        return;
    }
    const file = fileInput.files[0];
    const reader = new FileReader();
    reader.onload = (e) => {
        const data = new Uint8Array(e.target.result);
        const wb = XLSX.read(data, {type: 'array'});
        const ws = wb.Sheets[wb.SheetNames[0]];
        const json = XLSX.utils.sheet_to_json(ws, {header:1});
        
        // Iteramos filas, saltando la cabecera
        for(let i=1; i<json.length; i++){
            const row = json[i];
            const id = row[0];
            if(!id) continue;

            const inputs = document.querySelectorAll(`#pricesTable tbody tr td input[name^="products[${id}]"]`);
            for(let j=0; j<inputs.length; j++){
                if(row[j+3] !== undefined){
                    inputs[j].value = row[j+3]; // offset de columnas (ID, Producto, Imagen)
                }
            }
        }
    };
    reader.readAsArrayBuffer(file);
});
</script>
@endsection
