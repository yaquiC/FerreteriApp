// Variable global para guardar el ID del rol que se está editando
let currentEditingTypeOfProductId = null;

// Abrir modal y cargar datos
function editTypeOfProduct(id) {
    currentEditingTypeOfProductId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/typeofproduct/${id}`)
            .then(response => response.json())
            .then(data => {
                
                const typeOfProduct = data.typeOfProduct;
                document.getElementById('updateTypeOfProductType').value = typeOfProduct.type;


                const modal = new bootstrap.Modal(document.getElementById('updateTypeOfProductModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el tipo de producto:", error);
                alert("Error al obtener los datos de tipo de producto.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateTypeOfProductForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingTypeOfProductId) {
            alert("No se ha seleccionado ningún tipo de producto para editar");
            return;
        }

        const type = document.getElementById('updateTypeOfProductType').value;

        fetch(`http://localhost:8081/api/v1/typeofproduct/${currentEditingTypeOfProductId}`, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({type: type})
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
                    bootstrap.Modal.getInstance(document.getElementById('updateTypeOfProductModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el tipo de producto.");
                });
    });
});