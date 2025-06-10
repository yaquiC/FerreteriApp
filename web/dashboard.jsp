<%-- 
    Document   : dashboard
    Created on : 2 jun 2025, 21:37:14
    Author     : MINEDUCYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Responsive</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-900">

    <!-- Contenedor principal -->
    <div class="flex min-h-screen">
        
        <!-- Sidebar (oculto en celulares) -->
        <aside id="sidebar" class="w-64 bg-blue-900 text-white p-6 hidden md:block">
            <h2 class="text-lg font-bold mb-4">Ferretería El Martillo</h2>
            <nav class="flex flex-col gap-3">
                <a href="index.jsp" class="hover:bg-blue-700 p-2 rounded">🏠 Inicio</a>
                <a href="PRODUCTOS/ProductoPage.jsp" class="hover:bg-blue-700 p-2 rounded">📦 Inventario</a>
                <a href="SALES/salesPage.jsp" class="hover:bg-blue-700 p-2 rounded">💰 Ventas</a>
                <a href="CLIENTE/clientesPage.jsp" class="hover:bg-blue-700 p-2 rounded">🧑 Clientes</a>
                <a href="ROLES/rolesPage.jsp" class="hover:bg-blue-700 p-2 rounded">🔑 Roles</a>
                <a href="CATEGORIAS/categoriesPage.jsp" class="hover:bg-blue-700 p-2 rounded">📁 Categorías</a>
                <a href="TipoMedida/TipodeMedidaPage.jsp" class="hover:bg-blue-700 p-2 rounded">📏 Tipo de Medida</a>
                <a href="Reportes/reportesPage.jsp" class="hover:bg-blue-700 p-2 rounded">📊 Reportes</a>
                <a href="EMPLEADOS/employeePage.jsp" class="hover:bg-blue-700 p-2 rounded">👷 Empleados</a>
            </nav>
        </aside>

        <!-- Contenido principal -->
        <main class="flex-1 p-6">
            <header class="flex justify-between items-center mb-6">
                <h1 class="text-2xl font-bold">Dashboard</h1>
                <div class="flex gap-4">
                    <button onclick="toggleSidebar()" class="md:hidden bg-blue-600 text-white px-3 py-2 rounded">☰ Menú</button>
                    <button onclick="toggleDarkMode()" class="bg-gray-800 text-white px-4 py-2 rounded">Modo Oscuro</button>
                </div>
            </header>

            <!-- Tarjetas resumen -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <div onclick="location.href='Ventas/ventasPage.jsp'" class="bg-white p-6 rounded-lg shadow flex justify-between items-center hover:scale-105 transition cursor-pointer">
                    <div>
                        <p class="text-sm text-gray-500">Ventas Hoy</p>
                        <h3 class="text-xl font-bold">$125,430</h3>
                    </div>
                    <div class="bg-green-200 text-green-600 p-3 rounded-full">📈</div>
                </div>
                <div onclick="location.href='CLIENTE/clientesPage.jsp'" class="bg-white p-6 rounded-lg shadow flex justify-between items-center hover:scale-105 transition cursor-pointer">
                    <div>
                        <p class="text-sm text-gray-500">Clientes</p>
                        <h3 class="text-xl font-bold">892</h3>
                    </div>
                    <div class="bg-purple-200 text-purple-600 p-3 rounded-full">👥</div>
                </div>
                <div onclick="location.href='ROLES/rolesPage.jsp'" class="bg-white p-6 rounded-lg shadow flex justify-between items-center hover:scale-105 transition cursor-pointer">
                    <div>
                        <p class="text-sm text-gray-500">Roles</p>
                        <h3 class="text-xl font-bold">45 proveedores</h3>
                    </div>
                    <div class="bg-cyan-200 text-cyan-600 p-3 rounded-full">🔑</div>
                </div>
                <div onclick="location.href='CATEGORIAS/categoriesPage.jsp'" class="bg-white p-6 rounded-lg shadow flex justify-between items-center hover:scale-105 transition cursor-pointer">
                    <div>
                        <p class="text-sm text-gray-500">Categorías</p>
                        <h3 class="text-xl font-bold">12 empleados</h3>
                    </div>
                    <div class="bg-pink-200 text-pink-600 p-3 rounded-full">📁</div>
                </div>
            </div>
        </main>
    </div>

    <script>
        // cambiar a  modo oscuro pa la noche
        function toggleDarkMode() {
            document.body.classList.toggle('bg-gray-900');
            document.body.classList.toggle('text-white');
        }

        // Mostrar/ocultar sidebar en celulat es lo responsive xD
        function toggleSidebar() {
            document.getElementById('sidebar').classList.toggle('hidden');
        }
    </script>

</body>
</html>