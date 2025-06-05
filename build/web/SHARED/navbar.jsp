<%-- navbar.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo = request.getParameter("tituloPrincipal");
    String subtitulo = request.getParameter("subtitulo");
%>

<div class="flex items-center justify-between p-4 border-b bg-white">
    <!-- Sección izquierda -->
    <div class="flex items-center space-x-4">
        <!-- Flecha de regreso -->
        <button onclick="history.back()" class="text-gray-600 hover:text-black">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                 stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
            </svg>
        </button>
        <!-- Títulos dinámicos -->
        <div>
            <h1 class="text-lg font-semibold text-gray-900"><%= titulo%></h1>
            <p class="text-sm text-gray-500"><%= subtitulo%></p>
        </div>
    </div>

    <button class="flex items-center bg-red-500 hover:bg-red-700 text-white text-sm font-medium px-4 py-2 rounded-md shadow">
        <span>Cerrar cesion</span>
    </button>

</div>

