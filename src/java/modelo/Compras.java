package modelo;

/**
 *
 * @author chaly
 */
public class Compras {
      int id_compra;
    int id_usuario;
    float total;

    public Compras() {
    }

    public Compras(int id_compra, int id_usuario) {
        this.id_compra = id_compra;
        this.id_usuario = id_usuario;
    }

    public Compras(int id_compra, int id_usuario, float total) {
        this.id_compra = id_compra;
        this.id_usuario = id_usuario;
        this.total = total;
    }

    public int getId_compra() {
        return id_compra;
    }

    public void setId_compra(int id_compra) {
        this.id_compra = id_compra;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }
    
    
}
