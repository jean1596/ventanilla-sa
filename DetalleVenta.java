
package Modelo;

public class DetalleVenta {
    private int cod_venta;
    private String cod_pro;
    private int cantidad;
    private float total;
    private Producto producto;
    private Venta venta;

    public DetalleVenta() {
    }

    public DetalleVenta(int cod_venta, String cod_pro, int cantidad, float total, Producto producto, Venta venta) {
        this.cod_venta = cod_venta;
        this.cod_pro = cod_pro;
        this.cantidad = cantidad;
        this.total = total;
        this.producto = producto;
        this.venta = venta;
    }

    public int getCod_venta() {
        return cod_venta;
    }

    public void setCod_venta(int cod_venta) {
        this.cod_venta = cod_venta;
    }

    public String getCod_pro() {
        return cod_pro;
    }

    public void setCod_pro(String cod_pro) {
        this.cod_pro = cod_pro;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }
    
    

    
}
