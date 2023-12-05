package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import modelo.Articulo;
import modelo.Compras;
import modelo.Producto;
import modelo.Usuario;

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
                    System.out.println("Usuario " + nombre + " autenticado.");
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
    // PARA EL USUARIO -----------------------------------------------------------------------------------------------

    public boolean registrarUsuario(String usuario, String correo, String pass) {
        PreparedStatement pst = null;

        try {
            String consulta = "insert into usuarios (nombre, pass, correo, telefono, tipo) values(?,?,?,'N/A','usuario')";
            System.out.println("Consulta es;" + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, pass);
            pst.setString(3, correo);
            if (pst.executeUpdate() == 1) {
                return true;
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

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return false;
    }

    public int buscarUsuario(String usuario) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        int idUsuario = 0;
        try {
            String consulta = "select id_usuario from usuarios where nombre=?";
            System.out.println("Consulta es: " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            rs = pst.executeQuery();

            if (rs.next()) {
                return idUsuario = rs.getInt("id_usuario");
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
        return -1;

    }
    
       public Usuario obtenerUsuario( String nombre) {
        Usuario usuario = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where nombre=?";
            System.out.println("Consulta es: " + consulta);
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            rs = pst.executeQuery();

            if (rs.next()) {
                usuario = new Usuario(rs.getInt("id_usuario"), rs.getString("nombre"), rs.getString("pass"), rs.getString("correo"), rs.getString("telefono"), rs.getString("tipo"));
                String consulta2 = "select calle,colonia,ciudad,estado,pais,codigo_postal,numero_casa from direccion where id_usuario=?";
                System.out.println("Consulta es: " + consulta);
                pst = con.getConexion().prepareStatement(consulta2);
                pst.setInt(1, usuario.getId_usuario());
                rs = pst.executeQuery();

                if (rs.next()) {
                    usuario.usuarioDireccion(rs.getString("calle"), rs.getString("colonia"), rs.getString("ciudad"), rs.getString("estado"), rs.getString("pais"), rs.getInt("codigo_postal"), rs.getString("numero_casa"));
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
        return usuario;
    }
       
       public boolean eliminarUsuarios(int id_usuario) {
        PreparedStatement pst = null;
        try {

            String consulta = "DELETE FROM direccion WHERE id_usuario = ?";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, id_usuario);

            if (pst.executeUpdate() == 1) {
                consulta = "DELETE FROM usuarios WHERE id_usuario = ?";
                pst = con.getConexion().prepareStatement(consulta);
                pst.setInt(1, id_usuario);
                if (pst.executeUpdate() == 1) {
                    return true;
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
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }
       
        //  -----------------------------------------------------------------------------------------------


    // PARA EL CARRITO DE COMPRAS -----------------------------------------------------------------------------------------------
    
    public ArrayList<Compras> comprasUsuario(String usuario) {
        int id_usuario = this.buscarUsuario(usuario);
        con = new Conexion();
        ArrayList<Compras> compras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "select * from compras where id_usuario=?";
            pst = con.getConexion().prepareStatement(sql);
            pst.setInt(1, id_usuario);
            rs = pst.executeQuery();
            while (rs.next()) {
                compras.add(new Compras(rs.getInt("id_compra"), rs.getInt("id_usuario"), rs.getFloat("total")));
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
            } catch (Exception e) {

            }
        }
        return compras;
    }
    
    public int registrarCompras(int id_usuario, float total) {
        PreparedStatement pst = null;
        try {

            String consulta = "insert into compras(id_usuario,total) values(?,?)";
            pst = con.getConexion().prepareStatement(consulta, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, id_usuario);
            pst.setFloat(2, total);

            int filas = pst.executeUpdate();

            if (filas == 1) {
                // Obtener las claves generadas
                ResultSet generatedKeys = pst.getGeneratedKeys();

                if (generatedKeys.next()) {
                    int id_compra = generatedKeys.getInt(1); // Obtener el ID de la compra
                    return id_compra;
                } else {
                    // No se pudo obtener el ID generado
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
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return -1;
    }

    public ArrayList<Producto> obtenerProductos(int id_compra) {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = new Conexion();
            String sql = "SELECT productos.*, compra_producto.cantidad_producto FROM productos "
                    + "JOIN compra_producto ON productos.id_producto = compra_producto.id_producto "
                    + "JOIN compras ON compra_producto.id_compra = compras.id_compra "
                    + "WHERE compras.id_compra = ?";
            pst = con.getConexion().prepareStatement(sql);
            pst.setInt(1, id_compra);
            rs = pst.executeQuery();

            while (rs.next()) {
                int idProducto = rs.getInt("id_producto");
                String nombre = rs.getString("nombre");
                String imgProducto = rs.getString("img_producto");
                String tipo = rs.getString("tipo");
                float precio = rs.getFloat("precio");
                int cantidad = rs.getInt("cantidad_producto");

                productos.add(new Producto(idProducto, nombre, imgProducto, precio, tipo, cantidad));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Manejo básico de excepciones para depuración
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
            } catch (Exception e) {
                e.printStackTrace(); // Manejo básico de excepciones para depuración
            }
        }
        return productos;
    }
    
    public boolean registrarVentas(Articulo articulo, int id_compra) {
        PreparedStatement pst = null;
        try {

            ControladorProducto cp = new ControladorProducto();
            Producto producto = cp.getProducto(articulo.getIdProducto());
            producto.setStock(producto.getStock() - articulo.getCantidad());
            this.actualizarProductos(producto);
            float subtotal = producto.getPrecio() * articulo.getCantidad();
            String consulta = "insert into compra_producto(cantidad_producto,id_compra,id_producto,subtotal_precio) values(?,?,?,?)";
            con = new Conexion();
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, articulo.getIdProducto());
            pst.setInt(2, id_compra);
            pst.setInt(3, articulo.getIdProducto());
            pst.setFloat(4, subtotal);

            if (pst.executeUpdate() == 1) {

                return true;
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
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }
    
        // PARA LOS PRODUCTOS -----------------------------------------------------------------------------------------------

    public boolean actualizarProductos(Producto producto) {
        PreparedStatement pstUsuarios = null;

        try {
            // Actualizar información en la tabla de usuarios
            String consultaUsuarios = "UPDATE productos SET nombre=?, img_producto=?, precio=?, tipo=?, stock=? WHERE id_producto=?";
            pstUsuarios = con.getConexion().prepareStatement(consultaUsuarios);
            pstUsuarios.setString(1, producto.getNombre());
            pstUsuarios.setString(2, producto.getImg());
            pstUsuarios.setFloat(3, producto.getPrecio());
            pstUsuarios.setString(4, producto.getTipo());
            pstUsuarios.setInt(5, producto.getStock());
            pstUsuarios.setInt(6, producto.getId());

            if (pstUsuarios.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (con.getConexion() != null) {
                    con.getConexion().close();
                }
                if (pstUsuarios != null) {
                    pstUsuarios.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }

     public boolean eliminarProducto(int id_producto) {
        PreparedStatement pst = null;
        try {

            System.out.println("Agregar");
            String consulta = "DELETE FROM productos WHERE id_producto = ?";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setInt(1, id_producto);

            if (pst.executeUpdate() == 1) {
                return true;
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
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

     public boolean agregarProducto(String nombre, String img, float precio, String tipo, int stock) {
        PreparedStatement pst = null;
        try {

            System.out.println("Agregar");
            String consulta = "insert into productos(nombre,img_producto,precio,tipo,stock) values(?,?,?,?,?)";
            pst = con.getConexion().prepareStatement(consulta);
            pst.setString(1, nombre);
            pst.setString(2, img);
            pst.setFloat(3, precio);
            pst.setString(4, tipo);
            pst.setInt(5, stock);

            if (pst.executeUpdate() == 1) {
                return true;
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
            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        return false;
    }

    // -----------------------------------------------------------------------------------------------
}
