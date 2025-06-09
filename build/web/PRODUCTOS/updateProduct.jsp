<!-- Modal para actualizar cliene -->
<div class="modal fade" id="updateProductModal" tabindex="-1" aria-labelledby="updateProductModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form id="updateProductForm"> <!-- ? Este ID es esencial -->
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="updateProductModalLabel">Actualizar Producto</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="updateProducteName" class="form-label">Nombre</label>
            <input type="text" class="form-control" id="updateProducteName" required>
          </div>
            <div class="mb-3">
            <label for="updateProductCode" class="form-label">Codigo</label>
            <input type="text" class="form-control" id="updateProductCode" required>
          </div>
          <div class="mb-3">
            <label for="updateProductPrice" class="form-label">Precio</label>
            <input type="text" class="form-control" id="updateProductPrice" required>
          </div>
          <div class="mb-3">
            <label for="updateProductDescription" class="form-label">Descripcion</label>
            <input type="text" class="form-control" id="updateProductDescription" required>
          </div>
          <div class="mb-3">
            <label for="updateProductStock" class="form-label">Stock</label>
            <input type="text" class="form-control" id="updateProductStock" required>
          </div>
          <div class="mb-3">
            <label for="updateTypeOfMeasure" class="form-label">Tipo de medida</label>
            <input type="text" class="form-control" id="updateTypeOfMeasure" required>
          </div>
          <div class="mb-3">
            <label for="updateProductCategories" class="form-label">Categoria</label>
            <input type="text" class="form-control" id="updateProductCategories" required>
          </div>
          <div class="mb-3">
            <label for="updateTypeOfProduct" class="form-label">Tipo de Producto</label>
            <input type="text" class="form-control" id="updateTypeOfProduct" required>
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
