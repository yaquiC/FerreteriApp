<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Tipo</th>
                <th scope="col">Estado</th>
                 <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="typeOfProductBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<!-- Funciones JS para eliminar y actualizar -->
<script src="JS/deleteTypeOfProduct.js"></script>
<script src="JS/updateTypeOfProduct.js"></script>

<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/typeofproduct')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los tipos de producto');
                    }
                    return response.json();
                })
                .then(data => {
                    const typeOfProduct = data.typeOfProducts;
                    const typeOfProductBody = document.getElementById('typeOfProductBody');
                    
                    // se insertan datos a la tabla
                    typeOfProduct.forEach((typeOfProduct, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const typeCell = document.createElement('td');
                        typeCell.textContent = typeOfProduct.type;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = typeOfProduct.active ? 'Activo' : 'Inactivo';
                        
                         const actionsCell = document.createElement('td');

                    // Botón Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editTypeOfProduct(typeOfProduct.id); // ? Correcto: pasa el ID del rol
                    });

                    // Botón Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`¿Estás seguro de eliminar el Tipo de producto ?`)) {
                            deleteTypeOfProduct(typeOfProduct.id, row);
                        }
                    });

                    actionsCell.appendChild(editBtn);
                    actionsCell.appendChild(deleteBtn);

                        row.appendChild(idCell);
                        row.appendChild(typeCell);
                        row.appendChild(statusCell);
                        row.appendChild(actionsCell);

                        typeOfProductBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>