<!-- Modal para actualizar tipo de medida -->
<div class="modal fade" id="updateTypeOfProductModal" tabindex="-1" aria-labelledby="updateTypeOfProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateTypeOfProductForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateTypeOfProductModalLabel">Actualizar Tipo de Producto</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateTypeOfProductType" class="form-label">Tipo</label>
            <input type="text" class="form-control" id="updateTypeOfProductType" required>
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
