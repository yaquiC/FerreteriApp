<div class="w-full h-full p-4">
    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Codigo</th>
                <th scope="col">Precio</th>
                <th scope="col">Descripcion</th>
                <th scope="col">Stock</th>
                <th scope="col">Tipo de medida</th>
                <th scope="col">Categoria</th>
                <th scope="col">Tipo de producto</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
            </tr>
        </thead>
        <tbody id="productsBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<script src="JS/deleteProduct.js"></script>
<script src="JS/updateProduct.js"></script>

<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/products')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los productos');
                    }
                    return response.json();
                })
                .then(data => {
                    
                    const product = data.products;
                    const productsBody = document.getElementById('productsBody');
                    
                    // se insertan datos a la tabla
                    product.forEach((products, index) => {
                         console.log(products);
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nameCell = document.createElement('td');
                        nameCell.textContent = products.name;
                        
                        const codeCell = document.createElement('td');
                        codeCell.textContent = products.code;
                        
                        const priceCell = document.createElement('td');
                        priceCell.textContent = products.price;
                        
                        const descriptionCell = document.createElement('td');
                        descriptionCell.textContent = products.description;
                        
                        const stockCell = document.createElement('td');
                        stockCell.textContent = products.stock;
                        
                        const typeOfMeasureIdCell = document.createElement('td');
                        typeOfMeasureIdCell.textContent = products.typeOfMeasure?.name;
                        
                        const categoriesIdCell = document.createElement('td');
                        categoriesIdCell.textContent = products.categories?.name;
                        
                        const typeOfProductIdCell = document.createElement('td');
                        typeOfProductIdCell.textContent = products.typeOfProduct?.type;
                        
                        const statusCell = document.createElement('td');
                        statusCell.textContent = products.active ? 'Activo' : 'Inactivo';
                        
                         const actionsCell = document.createElement('td');

                    // Botón Editar
                    const editBtn = document.createElement('button');
                    editBtn.textContent = 'Editar';
                    editBtn.className = 'btn btn-success btn-sm me-2';
                    editBtn.addEventListener('click', () => {
                        editProduct(products.id); // ? Correcto: pasa el ID del rol
                    });

                    // Botón Eliminar
                    const deleteBtn = document.createElement('button');
                    deleteBtn.textContent = 'Eliminar';
                    deleteBtn.className = 'btn btn-danger btn-sm';
                    deleteBtn.addEventListener('click', () => {
                        if (confirm(`¿Estás seguro de eliminar el Producto?`)) {
                            deleteProduct(products.id, row);
                        }
                    });

                    actionsCell.appendChild(editBtn);
                    actionsCell.appendChild(deleteBtn);

                        row.appendChild(idCell);
                        row.appendChild(nameCell);
                        row.appendChild(codeCell);
                        row.appendChild(priceCell);
                        row.appendChild(descriptionCell);
                        row.appendChild(stockCell);
                        row.appendChild(typeOfMeasureIdCell);
                        row.appendChild(categoriesIdCell);
                        row.appendChild(typeOfProductIdCell);
                        row.appendChild(statusCell);
                        row.appendChild(actionsCell);
                        
                        productsBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>