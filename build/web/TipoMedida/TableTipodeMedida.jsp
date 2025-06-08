
<div class="w-full h-full p-4">

    <table class="table table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Nombre</th>
                <th scope="col">Estado</th>
                <th scope="col">Acciones</th>
  

            </tr>
        </thead>
        <tbody id="typeOfMeasureBody">
            <!-- Los datos se insertarán aquí -->
        </tbody>
    </table>
</div>

<script>
    // se ejecuta al entrar a la pagina
    document.addEventListener('DOMContentLoaded', function () {
        fetch('http://localhost:8081/api/v1/typeofmeasure')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Error al obtener los TipodeMedida');
                    }
                    return response.json();
                })
                .then(data => {
                    const typeOfMeasure = data.typeOfMeasure;
                    const typeOfMeasureBody = document.getElementById('typeOfMeasureBody');
                    
                    // se insertan datos a la tabla
                    typeOfMeasure.forEach((typeOfMeasure, index) => {
                        const row = document.createElement('tr');

                        const idCell = document.createElement('td');
                        idCell.textContent = index + 1;

                        const nameCell = document.createElement('td');
                        nameCell.textContent = typeOfMeasure.name;

                        const statusCell = document.createElement('td');
                        statusCell.textContent = typeOfMeasure.active ? 'Activo' : 'Inactivo';

                        row.appendChild(idCell);
                        row.appendChild(nameCell);
                        row.appendChild(statusCell);

                        typeOfMeasureBody.appendChild(row);
                    });
                })
                .catch(error => {
                    console.error('Hubo un problema con la petición Fetch:', error);
                });
    });
</script>