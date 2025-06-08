<%-- 
    Document   : TipodeMedidaPage
    Created on : 7 jun 2025, 13:39:54
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
        <!-- Navbar con parametros -->
        <jsp:include page="../SHARED/navbar.jsp">
            <jsp:param name="tituloPrincipal" value="Tpo de medida"/>
            <jsp:param name="subtitulo" value="Administracion de Tipo de medida"/>
            <jsp:param name="textoBoton" value="Agregar Tipo de Medida"/>
        </jsp:include>

        <!-- Modal para crear Tpio Medida -->
        <div class="w-full items-start flex p-4">
            <jsp:include page="createTipoMedida.jsp" />
        </div>
        
        <!-- Tabla de Tipo de medida -->
        <div class="p-4">
            <jsp:include page="TableTipodeMedida.jsp" />
        </div>

        <!-- Callate jaqueline -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
    </body>
</html>
