<!-- Modal para actualizar categoria -->
<div class="modal fade" id="updateCategoriesModal" tabindex="-1" aria-labelledby="updateCategoriesModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateCategoriesForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateCategoriesModalLabel">Actualizar Categoria</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateCategoriesName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateCategoriesName" required>
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
