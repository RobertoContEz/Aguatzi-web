<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String)objSesion.getAttribute("usuario");
    if(usuario == null) {
    response.sendRedirect("index.jsp");
    }
//%>
<%@page import="controlador.ControladorProducto" %>
<%
    ControladorProducto cp = new ControladorProducto();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es" class=" js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/img/logo - copia.png" type="image/x-icon">

        <title>Aguatzi</title>

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">



        <link href="assets/css/bootstrap.min.css" rel="stylesheet"type="text/css"/>
        <link href="assets/css/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/templatemo-tiya-golf-club.css" rel="stylesheet">


    </head>
    <body>

        <main>

            <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;"><nav class="navbar navbar-expand-lg" >         
                    
                    <div class="container">
                        <a class="navbar-brand d-flex align-items-center" href="index.jsp">
                            <img src="assets/img/logo - copia.png" class="navbar-brand-image img-fluid" alt="logo" width="40px" height="40px">
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
                                    <a class="nav-link click-scroll inactive" href="http://localhost:8080/Aguatzi-web/index.jsp#section_2">Nosotros</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll inactive" href="http://localhost:8080/Aguatzi-web/index.jsp#section_3">Contáctanos</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link click-scroll active" href="productos.jsp">Productos</a>
                                </li>

                            </ul>

                            <div class="d-none d-lg-block ms-lg-3">
                                <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Iniciar Sesión</a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>  


            <div class="conainer" >
                <header class="bg-white py-5">
                    <div class="container px-4 px-lg-5 my-5">
                        <div class="text-center text-black">
                            <h1 class="display-4 fw-bolder">Todos los Productos</h1>
                            <p class="lead fw-normal text-black-50 mb-0">Descubre nuestra variedad de garrafones</p>
                        </div>
                    </div>
                </header>

                <!-- Section-->
                <section class="py-5">
                    <div class="container px-4 px-lg-5 mt-5">
                        <h2 class="fw-bolder">Garrafones Lisos de 20 Litros</h2>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                            <!-- Garrafón 1 -->
                            <div class="col mb-5">
                                <div class="card h-120">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="assets/img/GARRAFON-19-LTS-AZUL.jpg"  alt="Garrafón Liso - Color Azul"  />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Garrafón</h5>
                                            <!-- Product price-->
                                            $100.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Garrafón 2 -->
                            <div class="col mb-5">
                                <div class="card h-120">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="assets/img/GARRAFON-19-LTS-VERDE.jpg"  alt="Garrafón Liso - Color Azul"  />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Garrafón</h5>
                                            <!-- Product price-->
                                            $100.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Garrafón 3 -->
                            <div class="col mb-5">
                                <div class="card h-120">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="assets/img/GARRAFON-19-LTS-MORADO.jpg"  alt="Garrafón Liso - Color Azul"  />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Garrafón</h5>
                                            <!-- Product price-->
                                            $100.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Garrafón 4 -->
                            <div class="col mb-5">
                                <div class="card h-120">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="assets/img/GARRAFON-19-LTS-ROJO.jpg"  alt="Garrafón Liso - Color Azul"  />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Garrafón</h5>
                                            <!-- Product price-->
                                            $100.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Garrafón 5 -->
                            <div class="col mb-5">
                                <div class="card h-120">
                                    <!-- Product image-->
                                    <img class="card-img-top" src="assets/img/GARRAFON-19-LTS-ROSA.jpg"  alt="Garrafón Liso - Color Azul"  />
                                    <!-- Product details-->
                                    <div class="card-body p-4">
                                        <div class="text-center">
                                            <!-- Product name-->
                                            <h5 class="fw-bolder">Garrafón</h5>
                                            <!-- Product price-->
                                            $100.00
                                        </div>
                                    </div>
                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Agregar al carrito</a></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>



            <!-- Footer -->
            <footer class="py-5 bg-dark">
                <div class="container"><p class="m-0 text-center text-white">Copyright &copy; 2023 Equipo 3 </p></div>
            </footer>
            <!-- Bootstrap core JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS -->
            <script src="js/scripts.js"></script>
    </body>
</html>
