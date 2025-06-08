<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Estado</th>
            </tr>
        </thead>
        <tbody id="pruductosBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/producto')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los productos');
                    }
                    return response.json();
                })
                .then(data => {
                    const productos = data.productos;
                    const productosBody = document.getElementById('productosBody');
                    
                    // se insertan datos a la tabla
                    productos.forEach((producto, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nameCell = document.createElement('td');
                        nameCell.textContent = productos.name;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = producto.active ? 'Activo' : 'Inactivo';

                        row.appendChild(idCell);
                        row.appendChild(nameCell);
                        row.appendChild(statusCell);

                        productosBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>