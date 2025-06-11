<%-- 
    Document   : salesPage
    Created on : 10 jun 2025, 14:46:54
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
        <jsp:include page="../SHARED/navbar.jsp">
            <jsp:param name="tituloPrincipal" value="Gestion de Ventas"/>
            <jsp:param name="subtitulo" value="Administracion de ventas"/>
        </jsp:include>

        <div class="w-full items-start flex p-4">
            <a href="createSales.jsp" class="btn btn-primary">
                Crear venta
            </a>
        </div>
        
        <!-- Tabla de roles -->
        <div class="p-4">
            <jsp:include page="tableSales.jsp" />
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
