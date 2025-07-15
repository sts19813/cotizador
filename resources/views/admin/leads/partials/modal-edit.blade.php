<div class="modal fade" id="editLeadModal{{ $lead->id }}" tabindex="-1" aria-labelledby="editLeadLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content p-3">
        <div class="modal-header">
          <h5 class="modal-title">Editar Lead</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <form action="{{ route('admin.leads.update', $lead) }}" method="POST">
          @csrf @method('PUT')
          <div class="modal-body">
              <label>Nombre</label>
              <input name="name" class="form-control mb-2" value="{{ $lead->name }}" required>
  
              <label>Email</label>
              <input name="email" type="email" class="form-control mb-2" value="{{ $lead->email }}" required>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary">Actualizar</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  