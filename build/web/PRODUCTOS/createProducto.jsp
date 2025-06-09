<%-- createRole.jsp --%>

<!-- Botón para abrir el modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear Producto
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Producto</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="productForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Nombre del Producto</label>
                            <input type="text" class="form-control" id="productName" name="productName" required>
                        </div>
                        <div class="mb-3">
                            <label for="productCode" class="form-label">Codigo del Producto</label>
                            <input type="text" class="form-control" id="productCode" name="productCode" required>
                        </div>
                        <div class="mb-3">
                            <label for="productPrice" class="form-label">Precio del Producto</label>
                            <input type="text" class="form-control" id="productPrice" name="productPrice" required>
                        </div>
                        <div class="mb-3">
                            <label for="productdescription" class="form-label">Descripcion del Producto</label>
                            <input type="text" class="form-control" id="productdescription" name="productdescription" required>
                        </div>
                        <div class="mb-3">
                            <label for="productStock" class="form-label">Stock </label>
                            <input type="text" class="form-control" id="productStock" name="productStock" required>
                        </div>
                        <div class="mb-3">
                            <label for="typeOfMeasureId" class="form-label">Tipo de medida </label>
                            <input type="text" class="form-control" id="typeOfMeasureId" name="typeOfMeasureId" required>
                        </div>
                        <div class="mb-3">
                            <label for="productCategoria" class="form-label">Categoria </label>
                            <input type="text" class="form-control" id="productCategoria" name="productCategoria" required>
                        </div>

                       <div class="mb-3">
                            <label for="typeOfProductId" class="form-label">Tipo de Producto </label>
                            <input type="text" class="form-control" id="typeOfProductId" name="typeOfProductId" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary">Guardar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
     
    document.getElementById("productForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("productName").value;
        const code = document.getElementById("productCode").value;
        const price = document.getElementById("productPrice").value;
        const description = document.getElementById("productdescription").value;
        const stock = document.getElementById("productStock").value;
        const typeOfMeasureId = document.getElementById("typeOfMeasureId").value;
        const categoriesId = document.getElementById("productCategoria").value;
        const typeOfProductId = document.getElementById("typeOfProductId").value;


        fetch("http://localhost:8081/api/v1/products", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({name: name,
                code: code,
                price: price,
                description: description,
                stock: stock,
                typeOfMeasureId:typeOfMeasureId,
                categoriesId:categoriesId,
                typeOfProductId:typeOfProductId})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Producto creado exitosamente.");
                        document.getElementById("productForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear el producto.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
                
                ;

    });
</script>

