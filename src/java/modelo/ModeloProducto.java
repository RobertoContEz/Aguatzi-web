
package modelo;

import controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author rc0nt
 */
public class ModeloProducto extends Conexion {
    
    public ArrayList<Producto> getAllProductos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "call selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                productos.add(new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getString("img_producto"),
                        rs.getFloat("precio"),
                        rs.getString("tipo"),
                        rs.getInt("stock")
                ));
            }
        } catch (Exception e) {
            System.out.println("Error en getAllProducts: "+e);
        } finally {
            try {
                if (rs!=null){
                    rs.close();
                }
                if (pst!=null) {
                    pst.close();
                }
                if(getConexion()!=null) {
                    getConexion().close();
                }
            }catch (Exception e) {
                System.out.println("Error en getAllProducts: "+e);
            }
        }
        return productos;
    }
    
    public Producto getProducto(int id) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String sql = "call selectProducto(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                producto = new Producto(
                        rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getString("img_producto"),
                        rs.getFloat("precio"),
                        rs.getString("tipo"),
                        rs.getInt("stock")
                );
            }
        } catch (Exception e) {
            System.out.println("Error en getProduct("+id+"): "+e);
        } finally {
            try {
                if (rs!=null){
                    rs.close();
                }
                if (pst!=null) {
                    pst.close();
                }
                if(getConexion()!=null) {
                    getConexion().close();
                }
            }catch (Exception e) {
                System.out.println("Error en getProduct("+id+"): "+e);
            }
        }
        return producto;
    }
}
