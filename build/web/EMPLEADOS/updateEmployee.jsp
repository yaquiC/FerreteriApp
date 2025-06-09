<!-- Modal para actualizar cliene -->
<div class="modal fade" id="updateEmployeeModal" tabindex="-1" aria-labelledby="updateEmployeeModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateEmployeeForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateEmployeeModalLabel">Actualizar Empleado</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateEmployeeName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateEmployeeName" required>
          </div>
            <div class="mb-3">
            <label for="updateEmployeeLastName" class="form-label">Apellido</label>
            <input type="text" class="form-control" id="updateEmployeeLastName" required>
          </div>
          <div class="mb-3">
            <label for="updateEmployeeAddress" class="form-label">Direccion</label>
            <input type="text" class="form-control" id="updateEmployeeAddress" required>
          </div>
          <div class="mb-3">
            <label for="updateEmployeePhone" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="updateEmployeePhone" required>
          </div>
          <div class="mb-3">
            <label for="updateEmployeeDui" class="form-label">Dui</label>
            <input type="text" class="form-control" id="updateEmployeeDui" required>
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
