/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author pc01
 */
public class Categoria {
    private int id;
    private String nombre;
    private String est;

    public Categoria(int id, String nombre, String est) {
        this.id = id;
        this.nombre = nombre;
        this.est = est;
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

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }
    
    
}
