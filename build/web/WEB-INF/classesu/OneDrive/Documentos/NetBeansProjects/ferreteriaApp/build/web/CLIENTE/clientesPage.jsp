<%-- 
    Document   : clientesPage
    Created on : 6 jun 2025, 11:57:09
    Author     : jacqu
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
         <!-- Navbar con parametros -->
        <jsp:include page="../SHARED/navbar.jsp">
            <jsp:param name="tituloPrincipal" value="Gestion de Clientes"/>
            <jsp:param name="subtitulo" value="Administracion de clientes"/>
            <jsp:param name="textoBoton" value="Agregar Cliente"/>
        </jsp:include>

        <!-- Modal para crear rol -->
        <div class="w-full items-start flex p-4">
            <jsp:include page="createCliente.jsp" />
        </div>
        
        <!-- Tabla de roles -->
        <div class="p-4">
            <jsp:include page="tableClientes.jsp" />
        </div>
        
        <jsp:include page="updateCliente.jsp" />

        <!-- Callate jaqueline -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
