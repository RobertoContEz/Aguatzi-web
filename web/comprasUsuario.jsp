<%-- 
    Document   : comprasUsuario
    Created on : 5/12/2023, 01:21:41 AM
    Author     : chaly
--%>
<%@page import="modelo.Compras"%>
<%@page import="modelo.Producto"%>
<%@page import="controlador.Consultas"%>
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
    Consultas sql=new Consultas();
    ArrayList<Compras> compras = sql.comprasUsuario(usuario);
    System.out.println(compras.size());
%> 

<html lang="es" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/templatemo-tiya-golf-club.css" rel="stylesheet">
        <style>
            .table-white-bg {
                background-color: #ffffff;
            }
        </style>
        <!-- Agrega tus enlaces a scripts JavaScript aquí -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/custom.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis compras</title>
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

        
 <%
            for(Compras compra : compras){
            int idCompra = compra.getId_compra();
            float total = compra.getTotal();
            ArrayList<Producto> productos = sql.obtenerProductos(idCompra);
            System.out.println(productos.size());
        %>
   
            <h2 style="text-align: center;">ID Compra: <%= idCompra %></h2>
        <h3 style="text-align: center;">Total Compra: <%= total %></h3>
        <table border="1" class="comprasTable">
            <thead>
                <tr>
                    <th>ID Producto</th>
                    <th>Nombre</th>
                    <th>Imagen </th>
                    <th>Precio </th>
                    <th>Cantidad </th>
                    <th>Subtotal </th>
                </tr>
            </thead>
            <tbody>
                <% for(Producto producto : productos){ %>
                    <tr>
                        <td><%= producto.getId() %></td>
                        <td><%= producto.getNombre() %></td>
                        <td><img src="<%= producto.getImg() %>" alt="" width="100px" height="100px"/></td>
                        <td><%= producto.getPrecio() %></td>
                        <td><%= producto.getStock() %></td>
                        <td><%= Math.round(producto.getPrecio() * producto.getStock() * 100.0) / 100.0%></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } %>
    
  <!-- Footer -->
        <%@include file="jspf/footerEquipo.jspf"%>

        <!-- JAVASCRIPT FILES -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/custom.js"></script>
        
         <script language="text/Javascript">
            cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
            function clearField(t) {                   //declaring the array outside of the
                if (!cleared[t.id]) {                      // function makes it static and global
                    cleared[t.id] = 1;  // you could use true and false, but that's more typing
                    t.value = '';         // with more chance of typos
                    t.style.color = '#fff';
                }
            }
        </script>
        
     
    </body>
</html>
