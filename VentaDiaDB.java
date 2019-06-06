
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class VentaDiaDB {
    public static ArrayList<VentaDIA> Venta_Dia(){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec Venta_del_dia ");
            /*Calendar fecha=new GregorianCalendar();
            int anio= fecha.get(Calendar.YEAR);
            int mes= fecha.get(Calendar.MONTH);
            int dia= fecha.get(Calendar.DAY_OF_MONTH);
            
            String fechaAct = (anio+"-"+(mes+1)+"-"+dia);
            System.out.println("Fecha: " + fechaAct);
            cst.setString(1, fechaAct);*/
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getFloat(5));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Cliente_mes(String nmes){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_Cliente_del_Mes ?");
            cst.setString(1, nmes);
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getString(1),rs.getFloat(2));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Prod_Mas_Vend(String F_I,String F_F){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_Prod_Mas_vendido ?,?");
            cst.setString(1, F_I);
            cst.setString(2, F_F);
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getString(1),rs.getInt(2));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Hist_compras(String F_I,String F_F){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_His_compra ?,?");
            cst.setString(1, F_I);
            cst.setString(2, F_F);
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getString(1),rs.getInt(2));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Prod_may_movimiento(){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_Prod_Mayor_Movimiento");
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Pedidos(){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_Pedidos");
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> PedidosXcliente(String cod){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_PED_Clientes ?");
            cst.setString(1, cod);
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static ArrayList<VentaDIA> Detalle_Pedidos(int cod){
        ArrayList<VentaDIA> list=new ArrayList<>();
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_DET_PED ?");
            cst.setInt(1, cod);
            ResultSet rs=cst.executeQuery();
                    while(rs.next()){
                        VentaDIA vent=new VentaDIA(rs.getInt(1),rs.getString(2),rs.getInt(3));
                        list.add(vent);
                    }
        }catch(Exception e){System.out.println(e+"");}
    return list;
    }
    public static void Cambiar_est_pedido(int cod){
        try{
            CallableStatement cst=Conexion.getConexion().prepareCall("exec SP_Camb_Est_ped ?");
            cst.setInt(1, cod);
            cst.executeUpdate();
        }catch(Exception e){System.out.println(e+"");}
    }
}
