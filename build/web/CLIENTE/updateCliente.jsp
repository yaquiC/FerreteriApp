<!-- Modal para actualizar cliene -->
<div class="modal fade" id="updateClientModal" tabindex="-1" aria-labelledby="updateClientModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateClientForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateClientModalLabel">Actualizar Cliente</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateClientName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateClientName" required>
          </div>
            <div class="mb-3">
            <label for="updateClientLastName" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="updateClientLastName" required>
          </div>
          <div class="mb-3">
            <label for="updateClientAddress" class="form-label">Direccion</label>
            <input type="text" class="form-control" id="updateClientAddress" required>
          </div>
          <div class="mb-3">
            <label for="updateClientPhone" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="updateClientPhone" required>
          </div>
          <div class="mb-3">
            <label for="updateClientDui" class="form-label">Dui</label>
            <input type="text" class="form-control" id="updateClientDui" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary">Actualizar</button> <!-- ? Tipo submit -->
        </div>
      </div>
    </form>
  </div>
</div>
