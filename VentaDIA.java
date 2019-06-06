
package Modelo;

public class VentaDIA {
    private String codigo;
    private String nombre;
    private String fecha_c;
    private String valor;
    private int n1;
    private int n2;
    private int nro_prod_adquiridos;
    private float importe_total;

    public VentaDIA(String codigo, String nombre, String fecha_c, int nro_prod_adquiridos, float importe_total) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.fecha_c = fecha_c;
        this.nro_prod_adquiridos = nro_prod_adquiridos;
        this.importe_total = importe_total;
    }
    //constructor para detalle pedido
    public VentaDIA(int n1,String nombre, int nro_prod_adquiridos) { 
        this.n1=n1;
        this.nombre = nombre;
        this.nro_prod_adquiridos = nro_prod_adquiridos;
    }
    //constructor para pedidos

    public VentaDIA(int n1,String codigo,String valor, String nombre, String fecha_c) {
        this.n1=n1;
        this.codigo = codigo;
        this.valor = valor;
        this.nombre = nombre;
        this.fecha_c = fecha_c;
    }
    
    
    //constructor para PROD_MAS_VENDIDO
    public VentaDIA(String nombre, int nro_prod_adquiridos) {    
        this.nombre = nombre;
        this.nro_prod_adquiridos = nro_prod_adquiridos;
    }

    //constructor para CLiente_Mes

    public VentaDIA(String nombre, float importe_total) {
        this.nombre = nombre;
        this.importe_total = importe_total;
    }
    //Constructor para Producto con mas movimiento
    public VentaDIA(String codigo, String nombre, int n1, int n2, int nro_prod_adquiridos) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.n1 = n1;
        this.n2 = n2;
        this.nro_prod_adquiridos = nro_prod_adquiridos;
    }
    

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFecha_c() {
        return fecha_c;
    }

    public void setFecha_c(String fecha_c) {
        this.fecha_c = fecha_c;
    }

    public int getN1() {
        return n1;
    }

    public void setN1(int n1) {
        this.n1 = n1;
    }

    public int getN2() {
        return n2;
    }

    public void setN2(int n2) {
        this.n2 = n2;
    }
    
    

    public int getNro_prod_adquiridos() {
        return nro_prod_adquiridos;
    }

    public void setNro_prod_adquiridos(int nro_prod_adquiridos) {
        this.nro_prod_adquiridos = nro_prod_adquiridos;
    }

    public float getImporte_total() {
        return importe_total;
    }

    public void setImporte_total(float importe_total) {
        this.importe_total = importe_total;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    
    
}
