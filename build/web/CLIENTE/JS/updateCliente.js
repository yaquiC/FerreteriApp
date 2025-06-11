// Variable global para guardar el ID del rol que se está editando
let currentEditingClientId = null;

// Abrir modal y cargar datos
function editCient(id) {
    currentEditingClientId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/client/${id}`) //Llama a la API para obtener los datos del cliente con ese id.
            .then(response => response.json())  
            .then(data => {
                
                //Llena el formulario del modal con los datos del cliente para que el usuario los pueda editar.
                const client = data.client;
                document.getElementById('updateClientName').value = client.nombre;
                document.getElementById('updateClientLastName').value = client.apellido;
                document.getElementById('updateClientAddress').value = client.direccion;
                document.getElementById('updateClientPhone').value = client.telefono;
                document.getElementById('updateClientDui').value = client.dui;
                
                //Abre el modal de edición llamado updateClientModal
                const modal = new bootstrap.Modal(document.getElementById('updateClientModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el cliente:", error);
                alert("Error al obtener los datos del cliente.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateClientForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingClientId) {
            alert("No se ha seleccionado ningún cliente para editar");
            return;
        }

        const nombre = document.getElementById('updateClientName').value;
        const apellido = document.getElementById('updateClientLastName').value;
        const direccion = document.getElementById('updateClientAddress').value;
        const telefono = document.getElementById('updateClientPhone').value;
        const dui = document.getElementById('updateClientDui').value;
        
        fetch(`http://localhost:8081/api/v1/client/${currentEditingClientId}`, {
            method: 'PUT',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({nombre: nombre,
                                 apellido: apellido,
                                 direccion:direccion,
                                 telefono: telefono,
                                 dui: dui}) 
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
                    alert("Cliente actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateClientModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el cliente.");
                });
    });
});