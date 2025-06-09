<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Direccion</th>
                <th scope="col">Telefono</th>
                <th scope="col">Dui</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="employeesBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>
<!-- Funciones JS para eliminar y actualizar -->
<script src="JS/deleteEmployee.js"></script>
<script src="JS/updateEmployee.js"></script>


<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/employee')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los empleados');
                    }
                    return response.json();
                })
                .then(data => {
                    const employees = data.employees;
                    const employeesBody = document.getElementById('employeesBody');
                    
                    // se insertan datos a la tabla
                    employees.forEach((employee, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nombreCell = document.createElement('td');
                        nombreCell.textContent = employee.nombre;
                        
                        const apellidoCell = document.createElement('td');
                        apellidoCell.textContent = employee.apellido;
                        
                        const direccionCell = document.createElement('td');
                        direccionCell.textContent = employee.direccion;
                        
                        const telefonoCell = document.createElement('td');
                        telefonoCell.textContent = employee.telefono;
                        
                        const duiCell = document.createElement('td');
                        duiCell.textContent = employee.dui;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = employee.active ? 'Activo' : 'Inactivo';
                        
                        const actionsCell = document.createElement('td');

                    // Botón Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editEmployee(employee.id); // ? Correcto: pasa el ID del rol
                    });

                    // Botón Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`¿Estás seguro de eliminar el Empleado?`)) {
                            deleteEmployee(employee.id, row);
                        }
                    });

                    actionsCell.appendChild(editBtn);
                    actionsCell.appendChild(deleteBtn);

                        row.appendChild(idCell);
                        row.appendChild(nombreCell);
                        row.appendChild(apellidoCell);
                        row.appendChild(direccionCell);
                        row.appendChild(telefonoCell);
                        row.appendChild(duiCell);
                        row.appendChild(statusCell);
                        row.appendChild(actionsCell);

                        employeesBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>