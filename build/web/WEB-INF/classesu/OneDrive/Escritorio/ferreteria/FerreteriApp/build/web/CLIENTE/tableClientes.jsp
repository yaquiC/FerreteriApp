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
        <tbody id="clientsBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>
<!-- Funciones JS para eliminar y actualizar -->
<script src="JS/deleteCliente.js"></script>
<script src="JS/updateCliente.js"></script>


<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/client')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los clientes');
                    }
                    return response.json();
                })
                .then(data => {
                    const clients = data.clients; //Se espera que la respuesta tenga un objeto clients, que es una lista de clientes.
                    const clientsBody = document.getElementById('clientsBody');
                    
                    // se insertan datos a la tabla
                    clients.forEach((client, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nombreCell = document.createElement('td');
                        nombreCell.textContent = client.nombre;
                        
                        const apellidoCell = document.createElement('td');
                        apellidoCell.textContent = client.apellido;
                        
                        const direccionCell = document.createElement('td');
                        direccionCell.textContent = client.direccion;
                        
                        const telefonoCell = document.createElement('td');
                        telefonoCell.textContent = client.telefono;
                        
                        const duiCell = document.createElement('td');
                        duiCell.textContent = client.dui;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = client.active ? 'Activo' : 'Inactivo';
                        
                        const actionsCell = document.createElement('td');

                    // Botón Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editCient(client.id); // ? Correcto: pasa el ID del rol
                    });

                    // Botón Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`¿Estás seguro de eliminar el Cliente?`)) {
                            deleteClient(client.id, row);
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

                        clientsBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>