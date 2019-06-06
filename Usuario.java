
package Modelo;

import java.sql.Timestamp;

public class Usuario {
    private String cod;
    private String nombre;
    private String apellido;
    private String cargo;
    private String correo;
    private String telefono;
    private Timestamp fecha_creacion;
    private char estado;
    private String contra;
    private String direccion;
    
    
    public Usuario(String cod, String nombre, String apellido, String cargo, String correo, String telefono, Timestamp fecha_creacion, char estado, String contra,String direccion) {
        this.cod = cod;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cargo = cargo;
        this.correo = correo;
        this.telefono = telefono;
        this.fecha_creacion = fecha_creacion;
        this.estado = estado;
        this.contra = contra;
        this.direccion=direccion;
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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public Timestamp getFecha_creacion() {
        return fecha_creacion;
    }

    public void setFecha_creacion(Timestamp fecha_creacion) {
        this.fecha_creacion = fecha_creacion;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    
    
    
}
