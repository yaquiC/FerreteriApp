<div class="w-full h-full p-4">
    <table class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="categoryBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<!-- Funciones JS para eliminar y actualizar -->
<script src="JS/deleteCategories.js"></script>
<script src="JS/updateCategories.js"></script>

<script>
    // Se ejecuta al entrar a la página
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/categories')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error al obtener las categorias');
                }
                return response.json();
            })
            .then(data => {
                const categories = data.categories;
                const categoriesBody = document.getElementById('categoryBody');

                categories.forEach((categories, index) => {
                    const row = document.createElement('tr');

                    const idCell = document.createElement('td');
                    idCell.textContent = index + 1;

                    const nameCell = document.createElement('td');
                    nameCell.textContent = categories.name;

                    const statusCell = document.createElement('td');
                    statusCell.textContent = categories.active ? 'Activa' : 'Inactiva';

                    const actionsCell = document.createElement('td');

                    // Botón Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editCategories(categories.id); // ? Correcto: pasa el ID de la categoria
                    });

                    // Botón Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`¿Estás seguro de eliminar la categoria "${categories.name}"?`)) {
                            deleteCategories(categories.id, row);
                        }
                    });

                    actionsCell.appendChild(editBtn);
                    actionsCell.appendChild(deleteBtn);

                    row.appendChild(idCell);
                    row.appendChild(nameCell);
                    row.appendChild(statusCell);
                    row.appendChild(actionsCell);

                    categoriesBody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Hubo un problema con la petición Fetch:', error);
            });
    });
</script>
