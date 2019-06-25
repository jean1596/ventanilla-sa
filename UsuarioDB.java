/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;

/**
 *
 * @author Docente
 */
public class UsuarioDB {
    public static boolean AgregarUSU(String nom,String ape,String correo,String phone,String contra,String direc){
    boolean rpta=false;
    try{
        CallableStatement cl=Conexion.getConexion().prepareCall("execute A_USUARIO ?,?,?,?,?,?");
        cl.setString(1, nom);
        cl.setString(2, ape);
        cl.setString(3, correo);
        cl.setString(4, phone);
        cl.setString(5, contra);
        cl.setString(6, direc);
        int i=cl.executeUpdate();
        if(i==1){rpta=true;}
        else{rpta=false;}
    }catch(Exception e){System.out.println(e+"");}
    
    return rpta;
    }
}
