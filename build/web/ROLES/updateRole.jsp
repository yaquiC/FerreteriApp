<!-- Modal para actualizar rol -->
<div class="modal fade" id="updateRoleModal" tabindex="-1" aria-labelledby="updateRoleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateRoleForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateRoleModalLabel">Actualizar Rol</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateRoleName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateRoleName" required>
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
