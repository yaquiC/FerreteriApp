<%-- createRole.jsp --%>

<!-- Botón para abrir el modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear Tipo de Producto
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Rol</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="typeOfProductForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="typeOfProductType" class="form-label">Tipo de producto</label>
                            <input type="text" class="form-control" id="typeOfProductType" name="typeOfProductType" required>
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
    document.getElementById("typeOfProductForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const type = document.getElementById("typeOfProductType").value;

        fetch("http://localhost:8081/api/v1/typeofproduct", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({type: type})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Tipo de producto creado exitosamente.");
                        document.getElementById("typeOfProductForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear el tipo de producto.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
    });
</script>

