/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function deleteClient(id, rowElement) {
    fetch(`http://localhost:8081/api/v1/client/${id}`, {
        method: 'DELETE'
    })
            .then(response => {
                if (!response.ok) {
                    throw new Error("No se pudo eliminar el Cliente.");
                }
                alert("Cliente eliminado correctamente.");
                rowElement.remove();
            })
            .catch(error => {
                console.error("Error al eliminar:", error);
                alert("Error al eliminar el cliente: " + error.message);
            });
}