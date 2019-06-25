<%-- 
    Document   : Ventas_del_dia
    Created on : 09/05/2019, 07:41:51 AM
    Author     : pc01
--%>

<%@page import="Modelo.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utils.Conexion"%>
<%@page import="java.sql.CallableStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usu=null;
String nom=null;
String cod_usu=null;
HttpSession sesionOK=request.getSession();
if(sesionOK.getAttribute("perfil")!=null){
nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
cod_usu=(String)sesionOK.getAttribute("codigo");        
}
%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/Logo_1.jpg"/>
        <title>Autopartes Ventanilla</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
    </head>
    <body>
        <main>
            <nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
        <a class="navbar-brand" href="index.jsp" ><img width="250"  src="img/LOGO_EMPRESA_1.png" ></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="index.jsp">Catálogo</a></li>
          <li><a >Categoria</a>
              <ul>
                  <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                  <li><a href="Agrega_categoria.jsp">Añadir Categoria</a></li>
                <% }
                  ArrayList<Categoria> ca=CategoriaDB.ListaCategoria();
                for(Categoria c: ca){%>
                  <li ><a href="Filtro.jsp?id=<%=c.getId()%>"><%=c.getNombre()%></a></li>
                  <%}%>
              </ul>
          </li>
          
          
        <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                <li><a href="Registrar_Producto.jsp">Registrar producto</a></li>
                <li><a >Reportes</a>
                <ul>
                    <li><a href="Ventas_del_dia.jsp?op=1">Historial de Ventas</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=2">Cliente del mes</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=3">Prod. Más Vendido</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=4">Historial de Compras</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=5">Movimiento de Productos</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=6">Pedidos</a></li>
                </ul>
                    </li>
                <% }
                %>
                <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Cliente")){
                    %>
                <li><a href="RegistrarVenta.jsp">Ver Carrito</a></li>
                <%}%>
                    
      </ul>      
      <ul class="nav navbar-nav navbar-right" >
          <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
                    <li><a  href="#"><%out.println("Bienvenido: "+nom);%></a>
                        <ul>
                        <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Cliente")){%>
                        
                            <li><a href="Ventas_del_dia.jsp?op=7&cod=<%=cod_usu%>">Mis Pedidos</a></li>
                        <%}%>
                        <li><a href="Servlet_logueo?accion=cerrar">Cerrar Sesión</a></li>
                        </ul> 
                    </li>
                <%
                }
                if(sesionOK.getAttribute("perfil")==null){
                %>
                <li><a href="Login.jsp">Iniciar Sesion</a></li>
                <%
                }
                %>
      </ul>
    </div>
  </div>
</nav>
                <% int option=Integer.parseInt(request.getParameter("op")); 
                if(option==1){
                %>
                <form name="Rep1" method="get">
            <br>
            <h2 align="center">Historial de Ventas</h2>
            <br>   
            <h4 align="center">Ingrese Rango de Fechas: <input type="date" name="f_ini" required=""> a <input type="date" name="F_FIN" required>
                <input type="hidden" name="op" value="1">
                <input type="submit" name="btnFechas" value="Ver" >
            </h4>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Codigo Venta</td>
                    <td>Nombre_Cliente</td>
                    <td>Fecha</td>
                    <td>Nro_Prod_Comprados</td>
                    <td>Importe_Total</td>
                    <td>Accion</td>
                </tr>
                <%if(request.getParameter("btnFechas")==null){%>
                <tr align="center"><td colspan="5">No hay Datos</td>  </tr>
                <%
                }else if(request.getParameter("btnFechas")!=null){
                String F_I=request.getParameter("f_ini");
                String F_F=request.getParameter("F_FIN");
                ArrayList<VentaDIA> vent=VentaDiaDB.Hist_Ventas(F_I, F_F);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getCodigo()%></td>
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getFecha_c()%></td>
                        <td><%=v.getNro_prod_adquiridos()%></td>
                        <td><%=v.getImporte_total()%></td>
                        <td><a href="Detalle_Pedido.jsp?idProd=<%=v.getCodigo()%>" title="Ver Detalles Del Pedido"><img width="15"  src="img/Suma.jpg" ></a></td>
                        
                    </tr>
                <%
                    }
                }
                %>
                </table>
             </form>
                <%
                }else if(option==2){
                %>
                <form name="rep2" method="get">
                 <br>
            <h2 align="center">Cliente Del Mes</h2>
            <br>
            <br>
            <h5 align="center">
             Elija un Mes:    
            <select name="CbxMes">
                <option value="Enero" >Enero</option>
                <option value="Febrero" >Febrero</option>
                <option value="Marzo" >Marzo</option>
                <option value="Abril" >Abril</option>
                <option value="Mayo" >Mayo</option>
                <option value="Junio" >Junio</option>
                <option value="Julio" >Julio</option>
                <option value="Agosto" >Agosto</option>
                <option value="Setiembre" >Setiembre</option>
                <option value="Octubre" >Octubre</option>
                <option value="Noviembre" >Noviembre</option>
                <option value="Diciembre" >Diciembre</option>
            </select>
            <input type="hidden" name="op" value="2">
                <input type="submit" name="btnMes" value="Ver" >    
            </h5> 
            <%if(request.getParameter("btnMes")!=null){
              String nom_Mes=request.getParameter("CbxMes");%>
            <br>
            <br>
            <h2 align="center"><%=nom_Mes%></h2>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Nombre Cliente</td>
                    <td>Importe Total del Mes</td>
                </tr>
                <%
                ArrayList<VentaDIA> vent=VentaDiaDB.Cliente_mes(nom_Mes);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getImporte_total()%></td>
                    </tr>
                <%
                    }
                %>
                </table>   
                <%}%>
                </form>
                <%}else if(option==3){%>
                <form name="rep3" align="center" method="get"> 
                <br>
            <h2 align="center">Producto Más Vendido</h2>
            <br>   
            <h4>Ingrese Rango de Fechas: <input type="date" name="f_ini" required=""> a <input type="date" name="F_FIN" required>
                <input type="hidden" name="op" value="3">
                <input type="submit" name="btnFechas" value="Ver" >
            </h4>
            <%if(request.getParameter("btnFechas")!=null){%>
            <br>
            <br>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Nombre Prod.</td>
                    <td>Cantidad de prod. vendidos</td>
                </tr>
                <%
                    String F_I=request.getParameter("f_ini");
                    String F_F=request.getParameter("F_FIN");
                ArrayList<VentaDIA> vent=VentaDiaDB.Prod_Mas_Vend(F_I, F_F);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getNro_prod_adquiridos()%></td>
                    </tr>
                <%
                    }
                %>
                </table>
                <%}%>
                </form>
                <%}else if(option==4){%>
                <form name="rep4" align="center"  method="get"> 
                <br>
            <h2 align="center">Historial de Compras</h2>
            <br>   
            <h4>Ingrese Rango de Fechas: <input type="date" name="f_ini" required=""> a <input type="date" name="F_FIN" required>
                <input type="hidden" name="op" value="4">
                <input type="submit" name="btnFechas" value="Ver" >
            </h4>
            <%if(request.getParameter("btnFechas")!=null){%>
            <br>
            <br>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Nombre Prod.</td>
                    <td>Cantidad de compras </td>
                </tr>
                <%
                    String F_I=request.getParameter("f_ini");
                    String F_F=request.getParameter("F_FIN");
                ArrayList<VentaDIA> vent=VentaDiaDB.Hist_compras(F_I, F_F);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getNro_prod_adquiridos()%></td>
                    </tr>
                <%
                    }
                %>
                </table>
                <%}%>
                </form  method="post">
                <%}else if(option==5){%>
                <form name="rep4" align="center"> 
                <br>
            <h2 align="center">Movimiento de productos</h2>
            <br>
            <br>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Unidades vendidas</td>
                    <td>Unidades compradas</td>
                    <td>Movimientos totales</td>
                </tr>
                <%
                ArrayList<VentaDIA> vent=VentaDiaDB.Prod_may_movimiento();
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getCodigo()%></td>
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getN1()%></td>
                        <td><%=v.getN2()%></td>
                        <td><%=v.getNro_prod_adquiridos()%></td>
                    </tr>
                <%
                    }
                %>
                </table>
                </form>
                <%}else if(option==6){%>
                <form name="rep4" align="center" action="Servlet_controlador"  method="get"> 
                <br>
            <h2 align="center">Pedidos</h2>
            <br>
            <br>
            <table border="1" align="center" width="800" >
                <tr align="center" bgcolor="#27E1C2">
                    <td>Codigo Pedido</td>
                    <td>Nombre cliente</td>
                    <td>Fecha del Pedido</td>
                    <td>Direccion cliente</td>
                    <td>Telefono</td>
                    <td>Estado</td>
                    <td colspan="2">Accion</td>
                </tr>
                <%
                ArrayList<VentaDIA> vent=VentaDiaDB.Pedidos();
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getN1()%></td>
                        <td><%=v.getCodigo()%></td>
                        <td><%=v.getValor()%></td>
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getValor2()%></td>
                        <td><%=v.getFecha_c()%></td>
                        <td><a href="Detalle_Pedido.jsp?idProd=<%=v.getN1()%>" title="Ver Detalles Del Pedido"><img width="15"  src="img/Suma.jpg" ></a></td>
                        <td><a href="Servlet_controlador?id_Ped=<%=v.getN1()%>&accion=Cambiar_Estado_Pedido" title="Ver Detalles Del Pedido">Entregado</a></td>
                    </tr>
                <%
                    }
                %>
                </table>
                </form>
                <%}else if(option==7){%>
                <form name="rep4" align="center" action="Servlet_controlador"  method="get"> 
                <br>
            <h2 align="center">Mis Pedidos</h2>
            <br>
            <br>
            <table border="1" align="center" width="800" >
                <tr align="center" bgcolor="#27E1C2">
                    <td>Codigo Pedido</td>
                    <td>Nombre cliente</td>
                    <td>Fecha del Pedido</td>
                    <td>Direccion cliente</td>
                    <td>Estado</td>
                    <td>Accion</td>
                </tr>
                <%
                    String cod_u=request.getParameter("cod");
                ArrayList<VentaDIA> vent=VentaDiaDB.PedidosXcliente(cod_u);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getN1()%></td>
                        <td><%=v.getCodigo()%></td>
                        <td><%=v.getValor()%></td>
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getFecha_c()%></td>
                        <td><a href="Detalle_Pedido.jsp?idProd=<%=v.getN1()%>" title="Ver Detalles Del Pedido"><img width="15"  src="img/Suma.jpg" ></a></td>
                        
                    </tr>
                <%
                    }
                %>
                </table>
                </form>
                <%}%>
            </main>
    </body>
</html>
