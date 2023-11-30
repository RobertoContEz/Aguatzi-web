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
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Carrito de Compras</title>
        <!-- Enlaces a Bootstrap y otros recursos necesarios -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Tu estilo personalizado u otros enlaces de estilo -->
    </head>
    <body>

        <main>

            <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;">
                <nav class="navbar navbar-expand-lg" style="width: 1857px;">                
                    <div class="container">
                        <a class="navbar-brand d-flex align-items-center" href="index.html">
                            <img src="assets/img/logo-copia.png" class="navbar-brand-image img-fluid" alt="logo" width="40px" height="40px">
                            <span class="navbar-brand-text">
                                Aguatzi
                                <small>Purificadora</small>
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
                                    <a class="nav-link click-scroll active" href="http://localhost:8080/Aguatzi-web/index.jsp#section_2">Nosotros</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="productos.jsp">Productos</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="carrito.jsp">Carrito</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="http://localhost:8080/Aguatzi-web/index.jsp#section_3">Contáctanos</a>
                                </li>
                            </ul>

                            
                        </div>
                    </div>
                </nav>
            </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-8">
                    <div class="table-responsive cart_info" id="cart-container">
                        <table class="table table-condensed" id="shop-table">
                            <thead>
                                <tr class="cart_menu">
                                    <td class="image">Productos</td>
                                    <td class="description"></td>
                                    <td class="price">Precio</td>
                                    <td class="quantity">Cantidad</td>
                                    <td class="total">Total</td>
                                    <td></td>
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
                                        <a href="#"><img src="<%=producto.getImg()%>" alt="<%=producto.getNombre()%>" width="100" height="100"></a>
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
                                            <!-- Modifica la forma en que el usuario interactúa con la cantidad según tus preferencias -->
                                            <input class="cart_quantity_input" type="text" name="quantity" value="<%= a.getCantidad()%>" autocomplete="off" size="2">
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">$<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                    </td>
                                    <td class="cart_delete">
                                        <span id="idarticulo" style="display:none;"><%= producto.getId()%> </span>
                                        <a class="cart_quantity_delete" href="#" id="deleteitem"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                        <% if (articulos == null || articulos.isEmpty()) {%>
                        <h4>No hay artículos en el carrito de compras</h4>
                        <% }%>
                    </div>
                    <a href="javascript:window.history.go(-2);">Seguir Comprando</a>
                </div>
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header bg-primary text-white">Resumen del Carrito</div>
                        <div class="card-body">
                            <table>
                                <tr>
                                    <td>Sub-total <span id="txt-subtotal">$ <%= Math.round(total * 100.0) / 100.0%></span></td>
                                </tr>
                                <tr>
                                    <td>IVA<span></td>
                                    <td>$ 0.0</span></td>
                                </tr>
                                <tr>
                                    <td>Total</td>
                                    <td><span id="txt-total">$ <%= Math.round(total * 100.0) / 100.0%></span></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <!-- Agrega tus enlaces a scripts JavaScript aquí -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/click-scroll.js"></script>
        <script src="assets/js/animated-headline.js"></script>
        <script src="assets/js/modernizr.js"></script>
        <script src="assets/js/custom.js"></script>
    </body>
    <script>
            function actualizarCantidad(index, idProducto) {
                // Implementa la lógica para actualizar la cantidad en el carrito
                var nuevaCantidad = parseInt(prompt("Ingrese la nueva cantidad:", ""));
                if (!isNaN(nuevaCantidad) && nuevaCantidad >= 0) {
                    // Realiza la actualización en el servidor
                    // ...
                    // Actualiza la cantidad en la interfaz
                    document.getElementsByName("cantidad")[index].value = nuevaCantidad;
                }
            }

            function eliminarProducto(index, idProducto) {
                // Implementa la lógica para eliminar el producto del carrito
                var confirmacion = confirm("¿Seguro que desea eliminar este producto?");
                if (confirmacion) {
                    // Realiza la eliminación en el servidor
                    // ...
                    // Elimina el producto de la interfaz
                    document.getElementsByName("cantidad")[index].parentNode.parentNode.remove();
                }
            }
        </script>
</html>

