/* global bootstrap */

// Variable global para guardar el ID del la categoria que se está editando
let currentEditingCategoriesId = null;

// Abrir modal y cargar datos
function editCategories(id) {
    currentEditingCategoriesId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/categories/${id}`)
            .then(response => response.json())
            .then(data => {
                const categories = data.categories;
                document.getElementById('updateCategoriesName').value = categories.name;

                const modal = new bootstrap.Modal(document.getElementById('updateCategoriesModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener la categoria:", error);
                alert("Error al obtener los datos de la categoria.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateCategoriesForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingCategoriesId) {
            alert("No se ha seleccionado ninguna categoria para editar");
            return;
        }

        const name = document.getElementById('updateCategoriesName').value;

        fetch(`http://localhost:8081/api/v1/categories/${currentEditingCategoriesId}`, {
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
                    alert("Categoria actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateCategoriesModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar la categoria.");
                });
    });
});