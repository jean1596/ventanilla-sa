
package Modelo;



public class Producto {
    private String cod;
    private String nombre;
    private int id_cat;
    private float precio;
    private int stock;
    private String imagen;
    private String Cod_usu_creador;
    private String fecha_creacion;
    private String estado; 

    public Producto(String cod, String nombre,int id_cat, float precio, String imagen) {
        this.cod = cod;
        this.nombre = nombre;
        this.id_cat = id_cat;
        this.precio = precio;
        this.stock = stock;
        this.imagen = imagen;
    }

    public Producto(String cod, String nombre,int id_cat , float precio, int stock, String imagen, String Cod_usu_creador, String fecha_creacion, String estado) {
        this.cod = cod;
        this.nombre = nombre;
        this.id_cat = id_cat;
        this.precio = precio;
        this.stock = stock;
        this.imagen = imagen;
        this.Cod_usu_creador = Cod_usu_creador;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
    }

    public Producto(String cod, String nombre, int id_cat, float precio) {
        this.cod = cod;
        this.nombre = nombre;
        this.id_cat = id_cat;
        this.precio = precio;
    }
    

    public String getCod() {
        return cod;
    }

    public void setCod(String cod) {
        this.cod = cod;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_cat() {
        return id_cat;
    }

    public void setId_cat(int id_cat) {
        this.id_cat = id_cat;
    }
    
    

    public float getPrecio() {
        return precio;
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

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public String getCod_usu_creador() {
        return Cod_usu_creador;
    }

    public void setCod_usu_creador(String Cod_usu_creador) {
        this.Cod_usu_creador = Cod_usu_creador;
    }

    public String getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(String fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
    
    
   
}
