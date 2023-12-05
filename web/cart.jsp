<%-- 
    Document   : carrito
    Created on : 27/11/2023, 10:20:20 PM
    Author     : Hiram
--%>
<%@page import="modelo.Articulo"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.ControladorProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    if (usuario.equals("")) {
        response.sendRedirect("index.jsp");
    }
%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<%@ page language="java" %>
<html lang="es" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Carrito de Compras</title>
        
        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/templatemo-tiya-golf-club.css" rel="stylesheet">
        <style>
            .table-white-bg {
                background-color: #ffffff; /* Cambia esto al color que desees */
            }
        </style>
        <!-- Agrega tus enlaces a scripts JavaScript aquí -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            function actualizarCantidad(index, idProducto) {
                var nuevaCantidad = parseInt(prompt("Ingrese la nueva cantidad:", ""));
                if (!isNaN(nuevaCantidad) && nuevaCantidad >= 0) {
                    document.getElementsByName("quantity")[index].value = nuevaCantidad;
                }
            }

            function eliminarProducto(index, idProducto) {
                var confirmacion = confirm("¿Seguro que desea eliminar este producto?");
                if (confirmacion) {
                    document.getElementsByName("quantity")[index].parentNode.parentNode.remove();
                }
            }
        </script>
    </head>
    
    <body>
        <main>
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

                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-lg-auto">
                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="index.jsp">Inicio</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="index.jsp#section_2">Nosotros</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="productos.jsp">Productos</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="cart.jsp">Carrito</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="index.jsp#section_3">Contáctanos</a>
                                </li>
                            </ul>

                            <div class="d-none d-lg-block ms-lg-3">
                                <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Iniciar Sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
            <!-- Division Inicio Sesion -->
            <div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">                
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel">Iniciar Sesión</h5>

                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>

                <div class="offcanvas-body d-flex flex-column">
                    <form class="custom-form member-login-form" action="iniciar" method="post" role="form">

                        <div class="member-login-form-body">
                            <div class="mb-4">
                                <label class="form-label mb-2" for="usuario">Nombre de usuario.</label>

                                <input type="text" name="usuario" id="usuario" class="form-control" placeholder="Nombre" required>
                            </div>

                            <div class="mb-4">
                                <label class="form-label mb-2" for="pass">Contraseña</label>

                                <input type="password" name="pass" id="pass" pattern="[0-9a-zA-Z]{4,10}" class="form-control" placeholder="Contraseña" required="">
                            </div>

                            <div class="col-lg-5 col-md-7 col-8 mx-auto">
                                <button type="submit" class="form-control">Entrar</button>
                            </div>

                            <div class="text-center my-4">
                                <a href="registrar.jsp">Haga click para registrase</a>
                            </div>
                        </div>
                    </form>
                </div>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#3D405B" fill-opacity="1" d="M0,224L34.3,192C68.6,160,137,96,206,90.7C274.3,85,343,139,411,144C480,149,549,107,617,122.7C685.7,139,754,213,823,240C891.4,267,960,245,1029,224C1097.1,203,1166,181,1234,160C1302.9,139,1371,117,1406,106.7L1440,96L1440,320L1405.7,320C1371.4,320,1303,320,1234,320C1165.7,320,1097,320,1029,320C960,320,891,320,823,320C754.3,320,686,320,617,320C548.6,320,480,320,411,320C342.9,320,274,320,206,320C137.1,320,69,320,34,320L0,320Z"></path></svg>
            </div>
            
            <section class="hero-section hero-50 d-flex justify-content-center align-items-center" id="section_1">
                <div class="section-overlay"></div>
                <svg viewBox="0 0 1962 178" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><path fill="#3D405B" d="M 0 114 C 118.5 114 118.5 167 237 167 L 237 167 L 237 0 L 0 0 Z" stroke-width="0"></path> <path fill="#3D405B" d="M 236 167 C 373 167 373 128 510 128 L 510 128 L 510 0 L 236 0 Z" stroke-width="0"></path> <path fill="#3D405B" d="M 509 128 C 607 128 607 153 705 153 L 705 153 L 705 0 L 509 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 704 153 C 812 153 812 113 920 113 L 920 113 L 920 0 L 704 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 919 113 C 1048.5 113 1048.5 148 1178 148 L 1178 148 L 1178 0 L 919 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 1177 148 C 1359.5 148 1359.5 129 1542 129 L 1542 129 L 1542 0 L 1177 0 Z" stroke-width="0"></path><path fill="#3D405B" d="M 1541 129 C 1751.5 129 1751.5 138 1962 138 L 1962 138 L 1962 0 L 1541 0 Z" stroke-width="0"></path></svg>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <br>
                            <br>
                            <h1 class="text-white mb-4 pb-2">Carrito de compras</h1>
                        </div>
                        <div class="col-sm-8">
                            <!-- Contenido de los productos del carrito -->
                            <div class="table-responsive cart_info" id="cart-container">
                                <table class="table table-condensed table-white-bg" id="shop-table">
                                    <thead>
                                        <tr class="cart_menu">
                                            <th class="image">Productos</th>
                                            <th class="description"></th>
                                            <th class="price">Precio</th>
                                            <th class="quantity">Cantidad</th>
                                            <th class="total">Total</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            ControladorProducto cp = new ControladorProducto();
                                            double total = 0;
                                            if (articulos != null) {
                                                for (Articulo a : articulos) {
                                                    Producto producto = cp.getProducto(a.getIdProducto());
                                                    total += a.getCantidad() * producto.getPrecio();
                                        %>
                                        <tr>
                                            <td class="cart_product">
                                                <a href="#"><img src="<%=producto.getImg()%>" alt="<%=producto.getNombre()%>"
                                                                 width="100" height="100"></a>
                                            </td>
                                            <td class="cart_description">
                                                <h4><a href="#"><%=producto.getNombre()%></a></h4>
                                                <p>Producto ID: <%=producto.getId()%></p>
                                            </td>
                                            <td class="cart_price">
                                                <p>$<%=producto.getPrecio()%></p>
                                            </td>
                                            <td class="cart_quantity">
                                                <div class="cart_quantity_button">
                                                    <input class="cart_quantity_input form-control" type="text" name="quantity"
                                                           value="<%= a.getCantidad()%>" autocomplete="off" size="2">
                                                </div>
                                            </td>
                                            <td class="cart_total">
                                                <p class="cart_total_price">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                            </td>
                                            <td class="cart_delete">
                                                <span id="idarticulo" style="display:none;"><%= producto.getId()%> </span>
                                                <a class="cart_quantity_delete btn btn-danger" href="#" id="deleteitem"><i
                                                        class="fa fa-times"></i></a>
                                            </td>
                                        </tr>
                                        <%
                                                }
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <% if (articulos == null || articulos.isEmpty()) { %>
                                <h4 class="text-center">No hay artículos en el carrito de compras</h4>
                                <% }%>
                            </div>
                            <a href="productos.jsp" class="btn btn-primary">Seguir Comprando</a>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <!-- Contenido del resumen del carrito -->
                        <div class="card">
                            <div class="card-header bg-primary text-white">Resumen del Carrito</div>
                            <div class="card-body">
                                <table class="table">
                                    <tr>
                                        <td>Sub-total</td>
                                        <td class="text-right">$ <%= Math.round(total * 100.0) / 100.0%></td>
                                    </tr>
                                    <tr>
                                        <td>IVA</td>
                                        <td class="text-right">$ 0.0</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td class="text-right">$ <%= Math.round(total * 100.0) / 100.0%></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
        </main>

        <footer class="site-footer">
            
        </footer>


        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/custom.js"></script>

    </body>
</html>