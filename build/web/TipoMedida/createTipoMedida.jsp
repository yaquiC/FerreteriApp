<%-- 
    Document   : createTipoMedida
    Created on : 7 jun 2025, 13:33:51
    Author     : MINEDUCYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Crear
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Crear Tipo de Medida</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="typeOfMeasureForm">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="TipodeMedidaName" class="form-label">Nombre del Tipo de Medida</label>
                            <input type="text" class="form-control" id="TipodeMedidaName" name="TipodeMedidaName" required>
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
    document.getElementById("typeOfMeasureForm").addEventListener("submit", function (e) {
        e.preventDefault(); // Evita que recargue la página

        const name = document.getElementById("TipodeMedidaName").value;

        fetch("http://localhost:8081/api/v1/typeofmeasure", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({name: name})
        })
                .then(response => {
                    if (response.ok) {
                        alert("Tipo de medida creado exitosamente.");
                        document.getElementById("typeOfMeasureForm").reset();
                        const modal = bootstrap.Modal.getInstance(document.getElementById("exampleModal"));
                        modal.hide();
                        location.reload();
                    } else {
                        return response.json().then(error => {
                            throw new Error(error.message || "Error al crear Tipo de medida.");
                        });
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("Ocurrió un error: " + error.message);
                });
    });
</script>
