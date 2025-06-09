<!-- Botón para abrir el modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear Empleado
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Empleado</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="employeeForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="employeeName" class="form-label">Nombre del Empleado</label>
                            <input type="text" class="form-control" id="employeeName" name="employeeName" required>
                        </div>
                        <div class="mb-3">
                            <label for="employeeLastname" class="form-label">Apellido del Empleado</label>
                            <input type="text" class="form-control" id="employeeLastname" name="employeeLastname" required>
                        </div>
                        <div class="mb-3">
                            <label for="employeeAddress" class="form-label">Direccion del Empleado</label>
                            <input type="text" class="form-control" id="employeeAddress" name="employeeAddress" required>
                        </div>
                        <div class="mb-3">
                            <label for="employeePhone" class="form-label">Telefono del Empleado</label>
                            <input type="text" class="form-control" id="employeePhone" name="employeePhone" required>
                        </div>
                        <div class="mb-3">
                            <label for="employeeDui" class="form-label">Dui del Empleado</label>
                            <input type="text" class="form-control" id="employeeDui" name="employeeDui" required>
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
    document.getElementById("employeeForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("employeeName").value;
        const apellido = document.getElementById("employeeLastname").value;
        const direccion = document.getElementById("employeeAddress").value;
        const telefono = document.getElementById("employeePhone").value;
        const dui = document.getElementById("employeeDui").value;

        fetch("http://localhost:8081/api/v1/employee", {
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
                        alert("Empleado creado exitosamente.");
                        document.getElementById("employeeForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear el empleado.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
    });
</script>