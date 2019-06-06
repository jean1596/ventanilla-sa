
package Modelo;

public class Venta {
    private int cod;
    private String cod_usu;
    private String fecha;
    private String direccion;
    private String Estado;

    public Venta(int cod, String cod_usu, String fecha,String direccion,String Estado) {
        this.cod = cod;
        this.cod_usu = cod_usu;
        this.fecha = fecha;
        this.direccion=direccion;
        this.Estado=Estado;
    }

    public Venta() {
    }
    

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getCod_usu() {
        return cod_usu;
    }

    public void setCod_usu(String cod_usu) {
        this.cod_usu = cod_usu;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }
    
    
    
    
    
}
