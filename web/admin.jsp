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
    String usuario = (String) request.getSession().getAttribute("usuario");
    if (usuario != null) {
        Usuario usuario = new Consultas().obtenerUsuario(usuario);
        if (usuario.getEstado() != null) {
            response.sendRedirect("index2.jsp");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
