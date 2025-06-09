// Variable global para guardar el ID del tipo de medida que se está editando
let currentEditingTypeOfMeasureId = null;

// Abrir modal y cargar datos
function editTypeOfMeasure(id) {
    currentEditingTypeOfMeasureId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/typeofmeasure/${id}`)
            .then(response => response.json())
            .then(data => {
                const typeOfMeasure = data.typeOfMeasure;
                document.getElementById('updateTypeOfMeasureName').value = typeOfMeasure.name;

                const modal = new bootstrap.Modal(document.getElementById('updateTypeOfMeasureModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el tipo de medida:", error);
                alert("Error al obtener los datos del tipo de medida.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateTipeOfMeasureForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingTypeOfMeasureId) {
            alert("No se ha seleccionado ningún tipo de medida para editar");
            return;
        }

        const name = document.getElementById('updateTypeOfMeasureName').value;

        fetch(`http://localhost:8081/api/v1/typeofmeasure/${currentEditingTypeOfMeasureId}`, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({name: name})
        })
                .then(response => {
                    if (!response.ok) {
                        return response.json().then(err => {
                            throw err;
                        });
                    }
                    // Si la respuesta está vacía pero el status es OK (200-299)
                    if (response.status === 204 || response.headers.get('content-length') === '0') {
                        return null; // No intentamos parsear JSON
                    }
                    return response.json();
                })
                .then(data => {
                    alert("Tipo de medida actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateTypeOfMeasureModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el tipo de medida.");
                });
    });
});