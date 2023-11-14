package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author chaly
 */
public class Conexion {
    private String USERNAME="root";
    private String PASSWORD="";
    private String HOST="localhost";
    private String PORT="3306";
 private String DATEBASE="aguatzidatabase";
   private String CLASSNAME="com.mysql.jdbc.Driver";
    private String URL="jdbc:mysql://"+HOST+":"+PORT+"/"+DATEBASE;
    private Connection con;
    
    public Conexion(){
        try{
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);            
        }catch(ClassNotFoundException e){
            System.err.println("Error en: "+e);
        }catch(SQLException e){
            System.err.println("Error en: "+e);
        }
    }
    
    public Connection getConexion(){
        return con;
    }
    
}
