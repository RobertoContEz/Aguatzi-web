
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
        String htmlcode = "";
        for (Producto producto : mp.getAllProductos()) {
            htmlcode += "<div class=\"col-sm-4\">\n" +
"							<div class=\"card\">\n" +
"								<div class=\"productinfo text-center\">\n" +
"									<img src=\""+producto.getImg()+"\" alt=\"\" width=\"230\" height=\"230\" />\n" +
"									<h2>$"+producto.getPrecio()+"</h2>\n" +
"									<p>"+producto.getNombre()+"</p>\n" +
"									<a href=\"product-details.jsp?id="+producto.getId()+"\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n" +
"								</div>\n" +
"								<div class=\"card-footer\">\n" +
"									<a href=\"\"><i class=\"fa fa-plus-square\"></i>Agregar al carrito</a>\n" +
"								</div>\n" +
"							</div>\n" +
"						</div>";
        }
        return htmlcode;
    }
    
    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }
}
