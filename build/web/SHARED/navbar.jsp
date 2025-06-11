<%-- navbar.jsp --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String titulo = request.getParameter("tituloPrincipal");
    String subtitulo = request.getParameter("subtitulo");
%>

<div class="flex items-center justify-between p-3 border-b bg-blue-900">
    <!-- Sección izquierda -->
    <div class="flex items-center space-x-4">
        <!-- Flecha de regreso -->
        <button onclick="history.back()" class="text-gray-300 hover:text-black">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24"
                 stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
            </svg>
        </button>
        <!-- Títulos dinámicos -->
        <div>
            <h1 class="text-lg font-semibold text-gray-100"><%= titulo%></h1>
            <p class="text-sm text-gray-300"><%= subtitulo%></p>
        </div>
    </div>

    

</div>

