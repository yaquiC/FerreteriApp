<%-- 
    Document   : createSales
    Created on : 10 jun 2025, 14:54:06
    Author     : MINEDUCYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>

        <jsp:include page="../SHARED/navbarSales.jsp">
            <jsp:param name="tituloPrincipal" value="Crear Ventas"/>
            <jsp:param name="subtitulo" value="Administracion de ventas"/>
        </jsp:include>

        <div class="container mt-5">
            <h2>Registro de Venta</h2>

            <div class="mb-3">
                <label class="form-label">Cliente</label>
                <select id="clienteSelect" class="form-select"></select>
            </div>

            <div class="mb-3">
                <label class="form-label">Empleado</label>
                <select id="empleadoSelect" class="form-select"></select>
            </div>

            <h4>Productos</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th>Cantidad</th>
                        <th>Agregar</th>
                    </tr>
                </thead>
                <tbody id="productosTable"></tbody>
            </table>
            <h4>Carrito</h4>
            <ul id="carrito" class="list-group mb-3"></ul>
            <p><strong>Total:</strong> $<span id="total">0.00</span></p>

            <button class="btn btn-success" onclick="enviarVenta()">Enviar Venta</button>

        </div>
        <script src="JSS/sales.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
