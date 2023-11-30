<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ControladorProducto" %>
<%@page import="modelo.Producto"%>
<%
    Producto producto = null; // Inicializa la variable

    // Obten el parámetro "id" de la solicitud
    String idParameter = request.getParameter("id");

    // Verifica si el parámetro "id" no es nulo y no está vacío
    if (idParameter != null && !idParameter.isEmpty()) {
        // Intenta convertir el parámetro "id" a un entero
        try {
            int id = Integer.parseInt(idParameter);
            producto = new ControladorProducto().getProducto(id);
        } catch (NumberFormatException e) {
            // Maneja la excepción de formato incorrecto si es necesario
            e.printStackTrace(); // Puedes cambiar esto según tus necesidades
        }
    } else {
        // Maneja el caso en que el parámetro "id" es nulo o vacío
        // Puedes redirigir a una página de error o realizar otras acciones según tus necesidades
        System.out.println("Error: El parámetro 'id' es nulo o vacío");
    }
%>
<%
    ControladorProducto cp=new ControladorProducto();
%>
<!DOCTYPE html>
<html lang="es" class="js flexbox canvas canvastext webgl no-touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers no-applicationcache svg inlinesvg smil svgclippaths">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="assets/img/logo-copia.png" type="image/x-icon">

        <title>Aguatzi</title>

        <!-- CSS FILES -->                
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,500;0,700;1,400&display=swap" rel="stylesheet">

        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/css/templatemo-tiya-golf-club.css" rel="stylesheet">
    </head>
    <body>
        <main>
        <div id="sticky-wrapper" class="sticky-wrapper" style="height: 88px;">
            <nav class="navbar navbar-expand-lg" style="width: 1857px;">                
                <div class="container">
                    <a class="navbar-brand d-flex align-items-center" href="index.html">
                        <img src="assets/img/logo-copia.png" class="navbar-brand-image img-fluid" alt="logo" width="40" height="40">
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

                        <div class="d-none d-lg-block ms-lg-3">
                            <a class="btn custom-btn custom-border-btn" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Iniciar Sesión</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>

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


        <div class="conainer" >
            <header class="bg-white py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-black">
                        <h1 class="display-4 fw-bolder">Todos los Productos</h1>
                        <p class="lead fw-normal text-black-50 mb-0">Descubre nuestra variedad de garrafones</p>
                    </div>
                </div>
            </header>
        </div>
    </main>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <h2 class="fw-bolder">Garrafones Lisos de 20 Litros</h2>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <%=cp.getProductos()%>
            </div>
        </div>
    </section>

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