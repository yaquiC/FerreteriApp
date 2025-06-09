// Variable global para guardar el ID del rol que se está editando
let currentEditingEmployeeId = null;

// Abrir modal y cargar datos
function editEmployee(id) {
    currentEditingEmployeeId = id; // Guardamos el ID en la variable global

    fetch(`http://localhost:8081/api/v1/employee/${id}`)
            .then(response => response.json())
            .then(data => {
                const employee = data;
                document.getElementById('updateEmployeeName').value = employee.nombre;
                document.getElementById('updateEmployeeLastName').value = employee.apellido;
                document.getElementById('updateEmployeeAddress').value = employee.direccion;
                document.getElementById('updateEmployeePhone').value = employee.telefono;
                document.getElementById('updateEmployeeDui').value = employee.dui;

                const modal = new bootstrap.Modal(document.getElementById('updateEmployeeModal'));
                modal.show();
            })
            .catch(error => {
                console.error("Error al obtener el empleado:", error);
                alert("Error al obtener los datos del empleado.");
            });
}

// Esperamos a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function () {
    // Asignamos el event listener al formulario
    document.getElementById('updateEmployeeForm')?.addEventListener('submit', function (e) {
        e.preventDefault();

        if (!currentEditingEmployeeId) {
            alert("No se ha seleccionado ningún empleado para editar");
            return;
        }

        const nombre = document.getElementById('updateEmployeeName').value;
        const apellido = document.getElementById('updateEmployeeLastName').value;
        const direccion = document.getElementById('updateEmployeeAddress').value;
        const telefono = document.getElementById('updateEmployeePhone').value;
        const dui = document.getElementById('updateEmployeeDui').value;
        
        fetch(`http://localhost:8081/api/v1/employee/${currentEditingEmployeeId}`, {
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
                    alert("Empleado actualizado correctamente.");
                    bootstrap.Modal.getInstance(document.getElementById('updateEmployeeModal')).hide();
                    location.reload();
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert(error.message || "Ocurrió un error al actualizar el empleado.");
                });
    });
});