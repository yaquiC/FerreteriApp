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
                <form id="productoForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="productoName" class="form-label">Nombre del Producto</label>
                            <input type="text" class="form-control" id="productoName" name="productoName" required>
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
    document.getElementById("productoForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("productoName").value;

        fetch("http://localhost:8081/api/v1/producto", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({name: name})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Producto creado exitosamente.");
                        document.getElementById("productoForm").reset();
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
    });
</script>

