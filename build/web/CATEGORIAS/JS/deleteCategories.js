/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// deleteCategorie.js

function deleteCategories(id, rowElement) {
    fetch(`http://localhost:8081/api/v1/categories/${id}`, {
        method: 'DELETE'
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error("No se pudo eliminar la categoria.");
                }
                alert("Categoria eliminado correctamente.");
                rowElement.remove();
            })
            .catch(error => {
                console.error("Error al eliminar:", error);
                alert("Error al eliminar la categoria: " + error.message);
            });
}
