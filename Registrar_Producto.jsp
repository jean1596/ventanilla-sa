
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utils.Conexion"%>
<%@page import="java.sql.CallableStatement"%>
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
        <title>Registrar Producto</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/estilos.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/flaticon.css"> 
    </head>
    <body>
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
      <br>
      <br>
      <br>
        <h2 align="center">Registrar Producto</h2>
        <br>
        <br>
        <form class="form-horizontal" action="Servlet_controlador" method="get">
            <table border="0" width="350" align="center">
                <% String imagen=request.getParameter("img");%>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom"  minlength="3" maxlength="40" required /></td>
                </tr>
                <tr> 
                    <td>Categoria: </td>
                    <td colspan="2">
                <select name="Cbx_CAT" size="1">
                <%
                ArrayList<Categoria> can=CategoriaDB.ListaCategoria();
                for(Categoria c: can){
                %>
                <option value="<%=c.getId()%>"><%=c.getNombre()%></option>
                <%}%>
                </select>
                </td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="number" name="txtPrecio" value="1" step="0.1" min="1" max="1500" required /></td>
                </tr>
                <tr>
                    <td colspan="5" align="center"><input type="submit" value="Registrar" name="CargarImagen"/></td>
                </tr>
                <input type="hidden" name="txtImagen" value="<%=imagen%>"/>
                <input type="hidden" name="accion" value="RegistrarProducto"/>
            </table>
        </form>
    </body>
</html>
