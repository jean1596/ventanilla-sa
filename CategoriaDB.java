/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

/**
 *
 * @author pc01
 */
public class CategoriaDB {
    public static ArrayList<Categoria> ListaCategoria(){
        ArrayList<Categoria> ls=new ArrayList<>();
    try{
        CallableStatement cl=Conexion.getConexion().prepareCall("execute C_CATEGORIA");
        ResultSet rs=cl.executeQuery();
        while(rs.next()){
        Categoria cat=new Categoria(rs.getInt(1),rs.getString(2),rs.getString(3));
        ls.add(cat);
        }
    }catch(Exception e){System.out.println(e+"");}
    return ls;
    }
    public static String Nom_cat(int ID){
        String ncat=null;
    try{
        CallableStatement cl=Conexion.getConexion().prepareCall("select nombre from CATEGORIA where ID=?");
        cl.setInt(1, ID);
        ResultSet rs=cl.executeQuery();
        while(rs.next()){
        ncat=rs.getString(1);
        }
    }catch(Exception e){System.out.println(e+"");}
    return ncat;
    }
    public static void A_cat(String nom){
    try{
        CallableStatement cl=Conexion.getConexion().prepareCall("execute A_CATEGORIA ?");
        cl.setString(1, nom);
        cl.executeUpdate();
    }catch(Exception e){System.out.println(e+"");}
    }
}
