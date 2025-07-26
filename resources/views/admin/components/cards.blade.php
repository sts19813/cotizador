<div class="row">
    <div class="col-md-4">
        <div class="card text-center shadow-sm">
            <div class="card-body">
                <h5>Total Leads</h5>
                <p>({{ $leads->count() }})<small class="text-muted">(1 nuevos)</small></p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-center shadow-sm">
            <div class="card-body">
                <h5>Productos</h5>
                <p>({{ $products->count() }}) <small class="text-muted">disponibles para personalización</small></p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="card text-center shadow-sm">
            <div class="card-body">
                <h5>Casas Creadas</h5>
                <p>({{ $Houses->count() }}) <small class="text-muted">({{ $Houses->count() }} guardada, 0 solicitada)</small></p>
            </div>
        </div>
    </div>
</div>
