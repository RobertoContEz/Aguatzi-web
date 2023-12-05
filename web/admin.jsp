<%-- 
    Document   : admin
    Created on : 5/12/2023, 02:41:48 AM
    Author     : chaly
--%>

<%@page import="modelo.Usuario"%>
<%@page import="modelo.ModeloUsuario"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.ModeloProducto"%>
<%@page import="controlador.Consultas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession(true);
    ModeloProducto mod = new ModeloProducto();
    ArrayList<Producto> productos = mod.getAllProductos();

    ModeloUsuario usu = new ModeloUsuario();
    ArrayList<Usuario> usuarios = usu.obtenerUsuarios();
%>

<% request.getSession().removeAttribute("carrito");
    String nombre = (String) request.getSession().getAttribute("nombre");
    if (nombre != null) {
        Usuario usuario = new Consultas().obtenerUsuario(nombre);
        if (usuario.getEstado() != null) {
            response.sendRedirect("index.jsp");
        }
    }
%>
<!DOCTYPE html>

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
                <link href="assets/css/templatemo-sixteen.css" rel="stylesheet" type="text/css"/>
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

    </head>



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
                <!-- Opciones -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="openAgregarProductoForm()">Agregar Producto
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="openActualizarProductoForm()">Actualizar Producto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="openEliminarProductoForm()">Eliminar Producto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="openEliminarUsuarioForm()">Eliminar Usuario</a>
                        </li>
                        <li  class="nav-item">
                            <a class="nav-link"  href="cerrarSesion" role="button" >Cerrar Sesión</a>
                        </li>
                    </ul>


                    <div class="w3-container">
                        <div id="agregarProductos" class="w3-modal" style="display:none">
                            <div class="w3-modal-content">
                                <div class="w3-container">
                                    <!-- Modal body -->
                                    <form action="agregarProductos" method="post">
                                        <h2>Agregar Productos</h2>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-font"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-image"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" oninput="validarPrecio(this)" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                            <select class="form-select" id="tipo" name="tipo" required>
                                                <option value="" disabled selected>Selecciona el tipo</option>
                                                <option value="Garrafon">Garrafón</option>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                        </div>
                                        <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                      aria-hidden="true"></i>Agregar Productos</button>
                                    </form>
                                    <br>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                                onclick="document.getElementById('agregarProductos').style.display = 'none'"
                                                class="w3-button w3-display-topright"">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="w3-container">
                        <div id="actualizarProductos" class="w3-modal" style="display:none">
                            <div class="w3-modal-content">
                                <div class="w3-container">
                                    <!-- Modal body -->
                                    <form action="actualizarProductos" method="post">
                                        <h2>Actualizar Productos</h2>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-font"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese el nombre del producto" id="nombreProducto" name="nombreProducto" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-image"></i></span>
                                            <input type="text" class="form-control" placeholder="Ingrese la ruta de la imagen" id="img" name="img" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el precio" id="precio" name="precio" oninput="validarPrecio(this)" required>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-tags"></i></span>
                                            <select class="form-select" id="tipo" name="tipo" required>
                                                <option value="" disabled selected>Selecciona el tipo</option>
                                                <option value="Garrafon">Garrafón</option>
                                                <!-- Agrega más opciones según sea necesario -->
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-list-ol"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el stock" id="stock" name="stock" oninput="validarNumero(this)" required>
                                        </div>
                                        <button type="submit"  class="modalIniciar"><i class="fa fa-user-circle"
                                                                                       aria-hidden="true"></i>Actualizar Productos</button>
                                    </form>
                                    <br>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                                onclick="document.getElementById('actualizarProductos').style.display = 'none'"
                                                class="w3-button w3-display-topright"">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="w3-container">
                        <div id="eliminarProductos" class="w3-modal" style="display:none">
                            <div class="w3-modal-content">
                                <div class="w3-container">
                                    <!-- Modal body -->
                                    <form action="eliminarProductos" method="post">
                                        <h2>Eliminar Productos</h2>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el id del producto" id="idProducto" name="idProducto" oninput="validarNumero(this)" required>
                                        </div>
                                        <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                      aria-hidden="true"></i>Eliminar Productos</button>
                                    </form>
                                    <br>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                                onclick="document.getElementById('eliminarProductos').style.display = 'none'"
                                                class="w3-button w3-display-topright"">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="w3-container">
                        <div id="eliminarUsuarios" class="w3-modal" style="display:none">
                            <div class="w3-modal-content">
                                <div class="w3-container">
                                    <!-- Modal body -->
                                    <form action="eliminarUsuarios" method="post">
                                        <h2>Eliminar Usuarios</h2>
                                        <br>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-hashtag"></i></span>
                                            <input type="number" class="form-control" placeholder="Ingrese el id del usuario" id="idProducto" name="idUsuario" oninput="validarNumero(this)" required>
                                        </div>
                                        <button type="submit" class="modalIniciar"><i class="fa fa-user-circle"
                                                                                      aria-hidden="true"></i>Eliminar Usuarios</button>
                                    </form>
                                    <br>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger"
                                                onclick="document.getElementById('eliminarUsuarios').style.display = 'none'"
                                                class="w3-button w3-display-topright"">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </nav>
    </header>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2>Usuarios</h2>
                <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Pass</th>
                            <th>Correo</th>
                            <th>Telefono</th>
                            <th>Tipo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Usuario usuario : usuarios) {%>
                        <tr>
                            <td><%= usuario.getId_usuario()%></td>
                            <td><%= usuario.getNombre()%></td>
                            <td><%= usuario.getPass()%></td>
                            <td><%= usuario.getCorreo()%></td>
                            <td><%= usuario.getTelefono()%></td>
                            <td><%= usuario.getTipo()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h2>Productos</h2>
                <br>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID </th>
                            <th>Nombre</th>
                            <th>Imagen</th>
                            <th>Precio</th>
                            <th>Tipo</th>
                            <th>Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Producto producto : productos) {%>
                        <tr>
                            <td><%= producto.getId()%></td>
                            <td><%= producto.getNombre()%></td>
                            <td><img src="<%= producto.getImg()%>" alt="Imagen" style="max-width: 100px; max-height: 100px;"></td>
                            <td><%= producto.getPrecio()%></td>
                            <td><%= producto.getTipo()%></td>
                            <td><%= producto.getStock()%></td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
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