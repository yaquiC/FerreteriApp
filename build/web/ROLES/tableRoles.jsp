<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Estado</th>
            </tr>
        </thead>
        <tbody id="rolesBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<script>
    // se ejecuta al entrar a la pagina
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
                    
                    // se insertan datos a la tabla
                    roles.forEach((role, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nameCell = document.createElement('td');
                        nameCell.textContent = role.name;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = role.active ? 'Activo' : 'Inactivo';

                        row.appendChild(idCell);
                        row.appendChild(nameCell);
                        row.appendChild(statusCell);

                        rolesBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>