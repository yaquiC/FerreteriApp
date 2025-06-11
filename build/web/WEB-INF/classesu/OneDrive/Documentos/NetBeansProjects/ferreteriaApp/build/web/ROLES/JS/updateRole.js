// Variable global para guardar el ID del rol que se está editando
let currentEditingRoleId = null;

// Abrir modal y cargar datos
function editRole(id) {
    currentEditingRoleId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/roles/${id}`)
            .then(response => response.json())
            .then(data => {
                const role = data.role;
                document.getElementById('updateRoleName').value = role.name;

                const modal = new bootstrap.Modal(document.getElementById('updateRoleModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el rol:", error);
                alert("Error al obtener los datos del rol.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateRoleForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingRoleId) {
            alert("No se ha seleccionado ningún rol para editar");
            return;
        }

        const name = document.getElementById('updateRoleName').value;

        fetch(`http://localhost:8081/api/v1/roles/${currentEditingRoleId}`, {
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
                    // Si la respuesta está vacía pero el status es OK 
                    if (response.status === 204 || response.headers.get('content-length') === '0') {
                        return null; // No intentamos parsear JSON
                    }
                    return response.json();
                })
                .then(data => {
                    alert("Rol actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateRoleModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el rol.");
                });
    });
});