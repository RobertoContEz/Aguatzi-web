/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;

import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Articulo;

/**
 *
 * @author rc0nt
 */
@WebServlet(name = "AddCart", urlPatterns = {"/agregarCarrito"})
public class AddCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Obtener la cantidad y el id del producto desde la solicitud
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            int idProducto = Integer.parseInt(request.getParameter("idproducto"));

            // Validar cantidad
            if (cantidad <= 0) {
                response.sendRedirect("error.jsp");
                return;
            }

            // Obtener la sesión actual o crear una nueva
            HttpSession session = request.getSession(true);

            // Obtener la lista de artículos del carrito desde la sesión
            ArrayList<Articulo> articulos = (ArrayList<Articulo>) session.getAttribute("carrito");

            // Si la lista de artículos aún no existe, crear una nueva
            if (articulos == null) {
                articulos = new ArrayList<>();
            }

            // Verificar si el producto ya está en el carrito
            boolean encontrado = false;
            for (Articulo a : articulos) {
                if (idProducto == a.getIdProducto()) {
                    a.setCantidad(a.getCantidad() + cantidad);
                    encontrado = true;
                    break;
                }
            }

            // Si el producto no está en el carrito, agregarlo
            if (!encontrado) {
                articulos.add(new Articulo(idProducto, cantidad));
            }

            // Guardar la lista actualizada en la sesión
            session.setAttribute("carrito", articulos);

            // Redirigir a la página del carrito
            response.sendRedirect("cart.jsp");

        } catch (NumberFormatException e) {
            // Manejar error si no se pueden convertir los parámetros a números
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
