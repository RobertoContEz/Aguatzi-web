
package controlador;

import modelo.ModeloProducto;
import modelo.Producto;

/**
 *
 * @author rc0nt
 */
public class ControladorProducto {
    
    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        StringBuilder htmlcode = new StringBuilder();

        for (Producto producto : mp.getAllProductos()) {
            htmlcode.append("<div class=\"col-sm-4\">\n")
                    .append("<div class=\"card\">\n")
                    .append("<div class=\"productinfo text-center\">\n")
                    .append("<img src=\"").append(producto.getImg()).append("\" alt=\"").append(producto.getNombre()).append("\" width=\"230\" height=\"230\" />\n")
                    .append("<h2>$").append(producto.getPrecio()).append("0</h2>\n")
                    .append("<p>").append(producto.getNombre()).append("</p>\n")
                    .append("</div>\n")
                    .append("   <div class=\"card-footer\">\n")
                    .append("       <form action=\"agregarproducto\" method=\"post\">\n")
                    .append("           <input type=\"hidden\" name=\"idproducto\" value=\"").append(producto.getId()).append("\">\n")
                    .append("           <input type=\"hidden\" name=\"cantidad\" value=\"1\">\n")
                    .append("           <button type=\"submit\" class=\"btn card-footer\">\n")
                    .append("               <i class=\"fa fa-plus-square\">Agregar al carrito</i> \n")
                    .append("           </button>\n")
                    .append("       </form>\n")
                    .append("   </div>\n")
                    .append("</div>\n")
                    .append("</div>");
        }

        return htmlcode.toString();
    
    }
    
    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }
}
