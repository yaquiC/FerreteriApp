// Variable global para guardar el ID del rol que se está editando
let currentEditingProductId = null;

// Abrir modal y cargar datos
function editProduct(id) {
    currentEditingProductId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/products/${id}`)
            .then(response => response.json())
            .then(data => {
                const product = data;
                document.getElementById('updateProducteName').value = product.name;
                document.getElementById('updateProductCode').value = product.code;
                document.getElementById('updateProductPrice').value = product.price;
                document.getElementById('updateProductDescription').value = product.description;
                document.getElementById('updateProductStock').value = product.stock;
                document.getElementById('updateTypeOfMeasure').value = product.typeOfMeasureId;
                document.getElementById('updateProductCategories').value = product.categoriesId;
                document.getElementById('updateTypeOfProduct').value = product.typeOfProductsId;

                const modal = new bootstrap.Modal(document.getElementById('updateProductModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el Producto:", error);
                alert("Error al obtener los datos del Producto.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateProductForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingProductId) {
            alert("No se ha seleccionado ningún producto para editar");
            return;
        }

        const name = document.getElementById('updateProducteName').value;
        const code = document.getElementById('updateProductCode').value;
        const price = document.getElementById('updateProductPrice').value;
        const description = document.getElementById('updateProductDescription').value;
        const stock = document.getElementById('updateProductStock').value;
        const typeOfMeasureId = document.getElementById('updateTypeOfMeasure').value;
        const categoriesId = document.getElementById('updateProductCategories').value;
        const typeOfProductsId = document.getElementById('updateTypeOfProduct').value;
        
        fetch(`http://localhost:8081/api/v1/products/${currentEditingProductId}`, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({name: name,
                code: code,
                price: price,
                description: description,
                stock: stock,
                typeOfMeasureId:typeOfMeasureId,
                categoriesId:categoriesId,
                typeOfProductId:typeOfProductId})
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
                    alert("Producto actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateProductModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el producto.");
                });
    });
});