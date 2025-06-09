<%-- 
    Document   : employeePage
    Created on : 8 jun 2025, 14:45:53
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
            <jsp:param name="tituloPrincipal" value="Gestion de Empleados"/>
            <jsp:param name="subtitulo" value="Administracion de empleados"/>
            <jsp:param name="textoBoton" value="Agregar Empleado"/>
        </jsp:include>

        <!-- Modal para crear empleado -->
        <div class="w-full items-start flex p-4">
            <jsp:include page="createEmployee.jsp" />
        </div>
        
        <!-- Tabla de empleados -->
        <div class="p-4">
            <jsp:include page="tableEmployee.jsp" />
        </div>
        
        <jsp:include page="updateEmployee.jsp" />

       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
    </body>
</html>
