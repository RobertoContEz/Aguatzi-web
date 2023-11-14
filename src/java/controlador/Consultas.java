package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author chaly
 */
public class Consultas {
    
    Conexion con = new Conexion();
    
    public Consultas() {
    }

     public int autenticacion(String nombre, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select tipo from usuarios where nombre=? and pass=?";
            System.out.println("Consulta es " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            if (rs.next()) {
                String tipo = rs.getString("tipo");
                if (tipo.equals("usuario")) {
                    System.out.println("Usuario "+nombre+" autenticado.");
                    return 1;
                } else {
                    return 2;
                }
            }

        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return 0;

    }
    
       public boolean registrarUsuario(String usuario, String correo, String pass) {
        PreparedStatement pst = null;
        
        try {
            String consulta = "insert into usuarios (nombre, pass, correo, telefono, tipo) values(?,?,?,'N/A','usuario')";
            System.out.println("Consulta es;" + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, pass);
            pst.setString(3, correo);
            if(pst.executeUpdate()==1){
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(con.getConexion()!=null){
                    con.getConexion().close();
                }
                if(pst!=null) pst.close();
                

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return false;
    }
    
}
