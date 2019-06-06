
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductoDB {
    public static ArrayList<Producto> BuscarProductoADMIN(String nom){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("execute B_ProdxNomADMIN ?");
         pst.setString(1, nom);
       ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static ArrayList<Producto> BuscarProducto(String nom){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("execute B_ProdxNom ?");
         pst.setString(1, nom);
       ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static ArrayList<Producto> ProdxCat(int nom){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("select*from producto where estado='A' and STOCK>=1 and ID_CATEGORIA=?");
         pst.setInt(1, nom);
       ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static ArrayList<Producto> ProdxCatADMIN(int nom){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("select*from producto where ID_CATEGORIA=?");
         pst.setInt(1, nom);
       ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static ArrayList<Producto> ListarProducto(){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("select * from producto where estado='A' and STOCK>=1 order by NOM_PRO");
         ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static ArrayList<Producto> ListarProductoADMIN(){
     ArrayList<Producto> Lst=new ArrayList<>();
     try{
         PreparedStatement pst=Conexion.getConexion().prepareStatement("select * from producto order by NOM_PRO");
       ResultSet rs=pst.executeQuery();
     while(rs.next()){
     Producto p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
     Lst.add(p);
     }
     }catch(Exception e){System.out.println(e+"");}
     return Lst;
     }
    public static Producto obtenerProducto(String cod){
    Producto p=null;
    try{
    CallableStatement cs=Conexion.getConexion().prepareCall("execute C_PRODUCTO ?");
    cs.setString(1, cod);
    ResultSet rs=cs.executeQuery();
    while(rs.next()){
    p=new Producto(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getFloat(4),rs.getInt(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
    }
    }catch(Exception e){System.out.println(e+"");}
    return p;
    }
    public static boolean actualizarProducto(Producto prod){
    boolean rpta=false;
    try{
    CallableStatement cs=Conexion.getConexion().prepareCall("execute M_PRODUCTO ?,?,?,?");
    cs.setString(1, prod.getCod());
    cs.setString(2, prod.getNombre());
    cs.setInt(3, prod.getId_cat());
    cs.setFloat(4, prod.getPrecio());
    int i=cs.executeUpdate();
    if(i==1){rpta=true;
    }else{rpta=false;}
    }catch(Exception e){System.out.println(e+"");}
    return rpta;
    }
    public static boolean AñadirProd(Producto p){
        boolean rpta=false;
        try{
        CallableStatement cs=Conexion.getConexion().prepareCall("execute A_PRODUCTO ?,?,?,?,?");
        cs.setString(1, p.getCod());
        cs.setString(2, p.getNombre());
        cs.setInt(3, p.getId_cat());
        cs.setFloat(4, p.getPrecio());
        cs.setString(5, p.getImagen());
        int i=cs.executeUpdate();
        if(i==1){rpta=true;
        }else{rpta=false;}
        }catch(Exception e){System.out.println("Error: "+e);}
        return rpta;
    }
    public static boolean CambiarEstado(String cod,String Est){
    boolean rpta=false;
    try{
    CallableStatement cl=Conexion.getConexion().prepareCall("execute E_PRODUCTO ?,?");
    cl.setString(1, cod);
    cl.setString(2, Est);
    int i=cl.executeUpdate();
        if(i==1){rpta=true;
        }else{rpta=false;}
    }catch(Exception e){System.out.println(e+"");}
    return rpta;
    }
    
    public static boolean Abastecer(String cod,int cant){
    boolean rpta=false;
    try{
    CallableStatement cl=Conexion.getConexion().prepareCall("exec SP_Compra_Rotacion ?,?");
    cl.setString(1, cod);
    cl.setInt(2, cant);
    int i=cl.executeUpdate();
        if(i==1){rpta=true;
        }else{rpta=false;}
    }catch(Exception e){System.out.println(e+"");}
    return rpta;
    }
}
