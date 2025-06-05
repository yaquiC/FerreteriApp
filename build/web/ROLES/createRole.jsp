<%-- createRole.jsp --%>

<!-- Botón para abrir el modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear rol
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
                <form id="roleForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="roleName" class="form-label">Nombre del rol</label>
                            <input type="text" class="form-control" id="roleName" name="roleName" required>
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
    document.getElementById("roleForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("roleName").value;

        fetch("http://localhost:8081/api/v1/roles", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({name: name})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Rol creado exitosamente.");
                        document.getElementById("roleForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear el rol.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
    });
</script>

