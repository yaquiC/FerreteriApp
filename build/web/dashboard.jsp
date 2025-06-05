<%-- 
    Document   : dashboard
    Created on : 2 jun 2025, 21:37:14
    Author     : MINEDUCYT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dasboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="bg-gray-50 text-gray-800">
        <!-- Header -->
        <header class="bg-white shadow flex justify-between items-center px-6 py-4">
            <div class="flex items-center gap-2">
                <img src="https://cdn-icons-png.flaticon.com/512/679/679720.png" alt="logo" class="w-8 h-8" />
                <div>
                    <h1 class="font-bold text-lg">Ferretería El Martillo</h1>
                    <p class="text-sm text-gray-500">Panel Administrativo</p>
                </div>
            </div>
            <div class="flex items-center gap-4">
                
                <div class="flex items-center gap-2">
                    <div class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center">
                        <svg class="w-5 h-5 text-gray-600" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M10 10a4 4 0 100-8 4 4 0 000 8zm-6 8a6 6 0 0112 0H4z" />
                        </svg>
                    </div>
                    <span>Admin</span>
                </div>
            </div>
        </header>

        <!-- Main content -->
        <main class="px-6 py-8">
            <h2 class="text-2xl font-bold mb-2">¡Bienvenido al Dashboard!</h2>
            <p class="text-sm text-gray-600 mb-6">Gestiona tu ferretería de manera eficiente desde un solo lugar</p>

            <!-- Cards resumen -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
                <div class="bg-white p-4 rounded-lg shadow flex justify-between items-center">
                    <div>
                        <p class="text-sm text-gray-500">Ventas Hoy</p>
                        <h3 class="text-xl font-bold">₡125,430</h3>
                    </div>
                    <div class="bg-green-100 text-green-600 p-2 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M5 10l4 4L15 7" />
                        </svg>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex justify-between items-center">
                    <div>
                        <p class="text-sm text-gray-500">Productos</p>
                        <h3 class="text-xl font-bold">1,247</h3>
                    </div>
                    <div class="bg-orange-100 text-orange-600 p-2 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2 2h16v16H2V2z" />
                        </svg>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex justify-between items-center">
                    <div>
                        <p class="text-sm text-gray-500">Clientes</p>
                        <h3 class="text-xl font-bold">892</h3>
                    </div>
                    <div class="bg-purple-100 text-purple-600 p-2 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M13 7a3 3 0 11-6 0 3 3 0 016 0zM2 13.5A4.5 4.5 0 016.5 9h7a4.5 4.5 0 014.5 4.5V17H2v-3.5z" />
                        </svg>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex justify-between items-center">
                    <div>
                        <p class="text-sm text-gray-500">Stock Bajo</p>
                        <h3 class="text-xl font-bold text-red-600">23</h3>
                    </div>
                    <div class="bg-red-100 text-red-600 p-2 rounded-full">
                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                        <path d="M2 2h16v16H2V2z" />
                        </svg>
                    </div>
                </div>
            </div>

            <!-- Opciones -->
            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                <div class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-emerald-100 text-emerald-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M2 2h16v16H2V2z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Inventario</h3>
                    </div>
                    <p class="text-sm text-gray-600">Gestión de productos, stock y categorías</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">1,247 productos</span>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-orange-100 text-orange-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M6 2a1 1 0 00-1 1v14a1 1 0 002 0V3a1 1 0 00-1-1zm8 0a1 1 0 00-1 1v14a1 1 0 002 0V3a1 1 0 00-1-1z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Ventas</h3>
                    </div>
                    <p class="text-sm text-gray-600">Registro de ventas y facturación</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">₡2.4M este mes</span>
                </div>
                <div onclick="location.href='CLIENTE/clientepage.jsp'" class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-purple-100 text-purple-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M13 7a3 3 0 11-6 0 3 3 0 016 0zM2 13.5A4.5 4.5 0 016.5 9h7a4.5 4.5 0 014.5 4.5V17H2v-3.5z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Clientes</h3>
                    </div>
                    <p class="text-sm text-gray-600">Base de datos de clientes y historial</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">892 clientes</span>
                </div>
                <div onclick="location.href='ROLES/rolesPage.jsp'" class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-cyan-100 text-cyan-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M5 3a2 2 0 012 2v10a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h1zm10 0a2 2 0 012 2v10a2 2 0 01-2 2h-1a2 2 0 01-2-2V5a2 2 0 012-2h1z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Roles</h3>
                    </div>
                    <p class="text-sm text-gray-600">Gestión de proveedores registrados</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">45 proveedores</span>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-pink-100 text-pink-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M10 10a4 4 0 100-8 4 4 0 000 8zM4 16a6 6 0 1112 0H4z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Empleados</h3>
                    </div>
                    <p class="text-sm text-gray-600">Gestión de empleados y usuarios</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">12 empleados</span>
                </div>
                <div class="bg-white p-4 rounded-lg shadow flex flex-col gap-1 cursor-pointer">
                    <div class="flex items-center gap-2">
                        <div class="bg-yellow-100 text-yellow-600 p-2 rounded-full">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M3 3h2v14H3V3zm12 0h2v14h-2V3zM7 6h6v2H7V6zm0 4h6v2H7v-2z" />
                            </svg>
                        </div>
                        <h3 class="font-bold">Reportes</h3>
                    </div>
                    <p class="text-sm text-gray-600">Análisis de ventas, stock y más</p>
                    <span class="text-xs bg-gray-100 text-gray-600 px-2 py-0.5 rounded-full self-end">15 reportes</span>
                </div>
            </div>
        </main>
    </body>
</html>
