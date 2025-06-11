<h1 class="mb-4">Listado de Ventas</h1>

<table class="table tabla-rayada">
  <thead class="table-dark">
    <tr>
      <th>Fecha</th>
      <th>Cliente</th>
      <th>Empleado</th>
      <th>Total</th>
      <th>Productos</th>
    </tr>
  </thead>
  <tbody id="CuerpoDeTablaDeVentas"></tbody>
</table>

<script>
        document.addEventListener('DOMContentLoaded', async function () {
            try {
                const res = await fetch("http://localhost:8081/api/v1/sales");
                const datos = await res.json();
                console.log("Respuesta de la API:", datos);
                
                // Cambio principal: usar 'sales' en lugar de 'ventas'
                if (datos.ok && Array.isArray(datos.sales)) {
                    const tbody = document.getElementById("CuerpoDeTablaDeVentas");
                    tbody.innerHTML = "";
                    
                    datos.sales.forEach((venta) => {
                        let ventaData;
                        try {
                            ventaData = JSON.parse(venta.jsonSales);
                            // Si jsonSales viene doblemente serializado
                            if (typeof ventaData === 'string') {
                                ventaData = JSON.parse(ventaData);
                            }
                        } catch (err) {
                            console.error("Error al analizar jsonSales:", venta.jsonSales, err);
                            return;
                        }
                        
                        const fecha = ventaData.fecha || "No especificado";
                        const cliente = ventaData.cliente || "No especificado";
                        const empleado = ventaData.empleado || "No especificado";
                        const total = ventaData.total !== undefined
                            ? "$" + Number(ventaData.total).toFixed(2)
                            : "$0.00";
                        const productos = Array.isArray(ventaData.productos) ? ventaData.productos : [];
                        
                        const productosHtml = productos.map(p =>
                            p.nombre + " (x" + p.cantidad + ") - $" + Number(p.precio).toFixed(2)
                        ).join("<br>");
                        
                        const tr = document.createElement("tr");
                        tr.innerHTML = 
                            "<td>" + fecha + "</td>" +
                            "<td>" + cliente + "</td>" +
                            "<td>" + empleado + "</td>" +
                            "<td>" + total + "</td>" +
                            "<td>" + productosHtml + "</td>";
                        tbody.appendChild(tr);
                    });
                } else {
                    console.error("Estructura de datos inesperada:", datos);
                    alert("No se pudieron cargar las ventas.");
                }
            } catch (error) {
                console.error("Error al cargar las ventas:", error);
                alert("Error de conexión con el servidor.");
            }
        });
    </script>
