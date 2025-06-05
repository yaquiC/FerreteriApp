<%-- 
    Document   : login
    Created on : 28 may 2025, 11:41:39 a. m.
    Author     : jacqu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/estilo.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0" >
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <img src="Imagenes/ferreteria1.png"
                                             class="img-fluid" alt="Sample image">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img src="Imagenes/icono.png"
                                                 style="width: 185px;" alt="logo">
                                            <h3 class="mt-1 mb-5 pb-1">¡Bienvenido!</h3>
                                        </div>

                                        <form name="login" action="login" method="POST">
                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <label class="form-label" for="form2Example11">Usuario</label>
                                                <input type="text" id="usuario" name="usuario" class="form-control"
                                                       placeholder="Ingrese su usuario" required />
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <label class="form-label" for="form2Example22">Contraseña</label>
                                                <input type="password" id="password" name="password" class="form-control" 
                                                       placeholder="Ingrese su contraseña" required/>
                                            </div>
                                            <div class="d-grid gap-2 col-6 mx-auto">
                                                <button class="btn btn-dark" type="submit">Inicar Sesion</button>
                                            </div>

                                        </form>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</html>
