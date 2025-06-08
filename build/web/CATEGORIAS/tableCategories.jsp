<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                 <!-- mire jaqueline la deje pero no se si va la comente por eso -->
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="categoriesBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<script>
    // se ejecuta al entrar a la pagina
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
                    const categoriesBody = document.getElementById('categoriesBody');
                    
                    // se insertan datos a la tabla
                    categories.forEach((categories, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nameCell = document.createElement('td');
                        nameCell.textContent = categories.name;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = categories.active ? 'Existente' : 'Sin existencia';

                        row.appendChild(idCell);
                        row.appendChild(nameCell);
                        row.appendChild(statusCell);

                        categoriesBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>