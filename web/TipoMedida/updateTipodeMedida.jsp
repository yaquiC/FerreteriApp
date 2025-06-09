<!-- Modal para actualizar Tipodemedida -->
<div class="modal fade" id="updateTypeOfMeasureModal" tabindex="-1" aria-labelledby="updateTypeOfMeasureModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateTipeOfMeasureForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateTypeOfMeasureModalLabel">Actualizar Tipo de Medida</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateTypeOfMeasureName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateTypeOfMeasureName" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </div>
      </div>
    </form>
  </div>
</div>

