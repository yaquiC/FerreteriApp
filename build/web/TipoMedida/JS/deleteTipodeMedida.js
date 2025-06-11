/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// deleteRole.js

function deleteTypeOfMeasure(id, rowElement) {
    fetch(`http://localhost:8081/api/v1/typeofmeasure/${id}`, {
        method: 'DELETE'
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error("No se pudo eliminar el tipo de medida.");
                }
                alert("Tipo de medida eliminado correctamente.");
                rowElement.remove();
            })
            .catch(error => {
                console.error("Error al eliminar:", error);
                alert("Error al eliminar el Tipo de medida: " + error.message);
            });
}
