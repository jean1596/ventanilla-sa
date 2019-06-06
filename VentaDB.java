
package Modelo;

import Utils.Conexion;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class VentaDB {
    public static boolean AñadirVenta(Venta varventa,ArrayList<DetalleVenta> d){
    boolean rpta=false;
    try{
        CallableStatement cst=Conexion.getConexion().prepareCall("execute A_venta ?,?,?");
        /*Con esto obtengo el parametro de salida del procedimiento almacenado*/
        cst.registerOutParameter(1, Types.INTEGER);
        cst.setString(2,varventa.getCod_usu());
        cst.setString(3, varventa.getDireccion());
        int i=cst.executeUpdate();
        
        int i2=0;
        varventa.setCod(cst.getInt(1));
        CallableStatement cst2=Conexion.getConexion().prepareCall("execute A_DETALLEVENTA ?,?,?,?");
        for(DetalleVenta aux: d){
            /* para modificar el Stock*/
            CallableStatement cst3=Conexion.getConexion().prepareCall("execute M_stock_Prod ?,?");
            cst3.setString(1, aux.getCod_pro());
            cst3.setInt(2, aux.getCantidad());
            cst3.executeUpdate();
            /*para agregar a tabla ROTACION*/
            CallableStatement cst4=Conexion.getConexion().prepareCall("exec SP_Ven_Rotacion ?,?");
            cst4.setString(1, aux.getCod_pro());
            cst4.setInt(2, aux.getCantidad());
            cst4.executeUpdate();
            /**/
        cst2.setInt(1, varventa.getCod());
        cst2.setString(2, aux.getCod_pro());
        cst2.setInt(3, aux.getCantidad());
        cst2.setFloat(4, aux.getTotal());
        i2=cst2.executeUpdate();
        }
        if(i2==1){
        rpta=true;
        }
    }catch(Exception e){JOptionPane.showMessageDialog(null, e);}
    return rpta;
    }
}
