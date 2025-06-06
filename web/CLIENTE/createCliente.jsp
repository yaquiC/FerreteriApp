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
                <form id="clientForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="clientName" class="form-label">Nombre del Cliente</label>
                            <input type="text" class="form-control" id="clientName" name="clientName" required>
                        </div>
                        <div class="mb-3">
                            <label for="clientLastname" class="form-label">Apellido del Cliente</label>
                            <input type="text" class="form-control" id="clientLastname" name="clientLastname" required>
                        </div>
                        <div class="mb-3">
                            <label for="clientAddress" class="form-label">Direccion del Cliente</label>
                            <input type="text" class="form-control" id="clientAddress" name="clientAddress" required>
                        </div>
                        <div class="mb-3">
                            <label for="clientPhone" class="form-label">Telefono del Cliente</label>
                            <input type="text" class="form-control" id="clientPhone" name="clientPhone" required>
                        </div>
                        <div class="mb-3">
                            <label for="clientDui" class="form-label">Dui del Cliente</label>
                            <input type="text" class="form-control" id="clientDui" name="clientDui" required>
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
    document.getElementById("clientForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("clientName").value;
        const apellido = document.getElementById("clientLastname").value;
        const direccion = document.getElementById("clientAddress").value;
        const telefono = document.getElementById("clientPhone").value;
        const dui = document.getElementById("clientDui").value;

        fetch("http://localhost:8081/api/v1/client", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({nombre: name,
                                 apellido: apellido,
                                 direccion:direccion,
                                 telefono: telefono,
                                 dui: dui})
           
        })
                .then(response => {
                    if (response.ok) {
                        alert("Cliente creado exitosamente.");
                        document.getElementById("clientForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear el cliente.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
    });
</script>