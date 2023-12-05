<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ControladorProducto" %>
<%@page import="modelo.Producto"%>

<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario.equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    Producto producto = null; // Inicializa la variable

%>
<%
    ControladorProducto cp =new ControladorProducto();
%>
<!DOCTYPE html>
<%@ page language="java" %>
<html lang="es" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Aguatzi</title>

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/templatemo-tiya-golf-club.css" rel="stylesheet">
        
        <!-- Agrega tus enlaces a scripts JavaScript aquí -->
        <script src="js/scripts.js"></script>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/custom.js"></script>
        
    </head>
    <body>
       
        <header class="">
            <nav class="navbar navbar-expand-lg" style="width: 1857px;">                
                <div class="container">
                    <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                        <img src="assets/img/logo-copia.png" class="navbar-brand-image img-fluid" alt="logo" width="40" height="40">
                        <span class="navbar-brand-text">
                            Purificadora
                            <small>Aguatzi</small>
                        </span>
                    </a>
                    <div class="d-lg-none ms-auto me-3">
                        <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Iniciar Sesión</a>
                    </div>
                    <!-- Opciones -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-lg-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp">Inicio</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="index.jsp#section_2">Nosotros</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="productos.jsp">Productos</a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="cart.jsp">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="comprasUsuario.jsp"">Mis compras</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp#section_3">Contáctanos</a>
                            </li>
                            <li  class="nav-item">
                                <a class="nav-link"  href="cerrarSesion" role="button" >Cerrar Sesión</a>
                            </li>
                        </ul>


                    </div>
                </div>
            </nav>
              </header>
        <main>
            
            <!-- Section Garrafones-->
            <section class="hero-section hero-50 d-flex justify-content-center align-items-center" id="section_1">
                <div class="section-overlay"></div>
                <svg viewBox="0 0 1962 178" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path fill="#3D405B" d="M 0 114 C 118.5 114 118.5 167 237 167 L 237 167 L 237 0 L 0 0 Z" stroke-width="0"></path> <path fill="#3D405B" d="M 236 167 C 373 167 373 128 510 128 L 510 128 L 510 0 L 236 0 Z" stroke-width="0"></path> <path fill="#3D405B" d="M 509 128 C 607 128 607 153 705 153 L 705 153 L 705 0 L 509 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 704 153 C 812 153 812 113 920 113 L 920 113 L 920 0 L 704 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 919 113 C 1048.5 113 1048.5 148 1178 148 L 1178 148 L 1178 0 L 919 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 1177 148 C 1359.5 148 1359.5 129 1542 129 L 1542 129 L 1542 0 L 1177 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 1541 129 C 1751.5 129 1751.5 138 1962 138 L 1962 138 L 1962 0 L 1541 0 Z" stroke-width="0"></path></svg>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <br>
                            <br>
                            <br>
                            <h1 class="text-white mb-4 pb-2">Garrafones lisos de 20 litros</h1>
                        </div>
                        <header class="bg-white py-5">
                            <div class="container px-4 px-lg-5 my-5">
                                <div class="text-center text-black">
                                    <h1 class="display-4 fw-bolder">Todos los Productos</h1>
                                    <p class="lead fw-normal text-black-50 mb-0">Descubre nuestra variedad de garrafones</p>
                                </div>
                            </div>
                        </header>
                    </div>
                    <div class="container px-4 px-lg-5 mt-5">
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center bg-white py-5">
                            <%=cp.getProductos()%>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    <!-- Footer -->
<<<<<<< HEAD
    <%@include file="jspf/footerEquipo.jspf"%>
    
=======
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2023 Equipo 3 </p></div>
    </footer>
    <!-- Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

>>>>>>> 0b51b8ab888c03751fbb2fa54389bdca65b0eda4
</body>
</html>