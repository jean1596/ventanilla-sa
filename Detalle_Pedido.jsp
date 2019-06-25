<%-- 
    Document   : Detalle_Pedido
    Created on : 29/05/2019, 04:45:40 PM
    Author     : pc01
--%>

<%@page import="Modelo.VentaDiaDB"%>
<%@page import="Modelo.VentaDIA"%>
<%@page import="Modelo.VentaDIA"%>
<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String usu=null;
String nom=null;
String C_USU=null;
String direc=null;
HttpSession sesionOK=request.getSession();
if(sesionOK.getAttribute("perfil")!=null){
nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
C_USU=(String)sesionOK.getAttribute("codigo");
direc=(String)sesionOK.getAttribute("dir");
}
%>
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
                        
                            <li><a href="Ventas_del_dia.jsp?op=7&cod=<%=C_USU%>">Mis Pedidos</a></li>
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
                <%int cod_ped=Integer.parseInt(request.getParameter("idProd"));%>
       <form name="xd" align="center" method="get"> 
                <br>
            <h2 align="center">Detalles Del Pedido Nro: <%=cod_ped%></h2>
            <br>
            <br>
            <table border="1" align="center" width="800">
                <tr align="center" bgcolor="#27E1C2">
                    <td>Codigo</td>
                    <td>Nombre</td>
                    <td>Cantidad</td>
                </tr>
                <%
                ArrayList<VentaDIA> vent=VentaDiaDB.Detalle_Pedidos(cod_ped);
                for(VentaDIA v: vent){
                    %>
                    <tr align="center">
                        <td><%=v.getN1()%></td>
                        <td><%=v.getNombre()%></td>
                        <td><%=v.getNro_prod_adquiridos()%></td>
                    </tr>
                <%
                    }
                %>
                </table>
                </form>
                <br>
                <br>
      
      
        </main>
    </body>
</html>
