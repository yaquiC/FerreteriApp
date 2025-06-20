<div class="w-full h-full p-4">
   <div class="table-responsive">
    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="rolesBody">
            <!-- Los datos se insertar�n aqu� -->
        </tbody>
    </table>
   </div>
</div>

<!-- Funciones JS para eliminar y actualizar -->
<script src="JS/deleteRole.js"></script>
<script src="JS/updateRole.js"></script>

<script>
    // Se ejecuta al entrar a la p�gina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/roles')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error al obtener los roles');
                }
                return response.json();
            })
            .then(data => {
                const roles = data.roles;
                const rolesBody = document.getElementById('rolesBody');

                roles.forEach((role, index) => {
                    const row = document.createElement('tr');

                    const idCell = document.createElement('td');
                    idCell.textContent = index + 1;

                    const nameCell = document.createElement('td');
                    nameCell.textContent = role.name;

                    const statusCell = document.createElement('td');
                    statusCell.textContent = role.active ? 'Activo' : 'Inactivo';

                    const actionsCell = document.createElement('td');

                    // Bot�n Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editRole(role.id); // ? Correcto: pasa el ID del rol
                    });

                    // Bot�n Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`�Est�s seguro de eliminar el rol "${role.name}"?`)) {
                            deleteRole(role.id, row);
                        }
                    });

                    actionsCell.appendChild(editBtn);
                    actionsCell.appendChild(deleteBtn);

                    row.appendChild(idCell);
                    row.appendChild(nameCell);
                    row.appendChild(statusCell);
                    row.appendChild(actionsCell);

                    rolesBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Hubo un problema con la petici�n Fetch:', error);
            });
    });
</script>
