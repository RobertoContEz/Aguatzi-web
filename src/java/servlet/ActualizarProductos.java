package servlet;

import controlador.Consultas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

/**
 *
 * @author chaly
 */
@WebServlet(name = "ActualizarProductos", urlPatterns = {"/actualizarProductos"})
public class ActualizarProductos extends HttpServlet {
    
    

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

        String id=request.getParameter("idProducto");
        String nomProd = request.getParameter("nombreProducto");
        String img = request.getParameter("img");
        String precio = request.getParameter("precio");
        String tipo = request.getParameter("tipo");
        String stock = request.getParameter("stock");

     

        int tam=id.lastIndexOf(id);
        if(id.charAt(tam)=='.'){
            String newId = id.substring(0, id.length() - 1);
            id=newId;
        }
        int id_producto=Integer.parseInt(id);
        float costo = Float.parseFloat(precio);
        
        int tam2=stock.lastIndexOf(stock);
        if(stock.charAt(tam2)=='.'){
            String newId = stock.substring(0, stock.length() - 1);
            stock=newId;
        }
        int cantidad = Integer.parseInt(stock);
     
        Producto producto=new Producto(id_producto, nomProd, img, costo, tipo, cantidad);

           Consultas sql = new Consultas();
           
        if (sql.actualizarProductos(producto)) {
            // Almacena el mensaje en la sesión
            request.getSession().setAttribute("mensaje", "Producto actualizado correctamente");
        } else {
            request.getSession().setAttribute("mensaje", "Error al actualizar el producto");
        }

        // Redirige a la misma página para mostrar el mensaje
        response.sendRedirect("admin.jsp");
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
