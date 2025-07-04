<%-- createCategories.jsp --%>

<!-- Bot�n para abrir el modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear Categoria
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Categoria</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="categoriesForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="categoriesName" class="form-label">Nombre de la Categoria</label>
                            <input type="text" class="form-control" id="categoriesName" name="categoriesName" required>
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
    document.getElementById("categoriesForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la p�gina

        const name = document.getElementById("categoriesName").value;

        fetch("http://localhost:8081/api/v1/categories", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({name: name})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Categoria creada exitosamente.");
                        document.getElementById("categoriesForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear la categoria.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurri� un error: " + error.message);
                });
    });
</script>

