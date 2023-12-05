
package modelo;

/**
 *
 * @author rc0nt
 */
public class Producto {
    private int id;
    private String nombre;
    private String img;
    private float precio;
    private String tipo;
    private int stock;

    public Producto() {
    }

    public Producto(int id, String nombre, String img, float precio, String tipo, int stock) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.tipo = tipo;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getPrecio() {
        return precio;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
    
}
