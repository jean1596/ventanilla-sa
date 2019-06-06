<%-- 
    Document   : ActualizarProducto
    Created on : 24/04/2019, 05:37:34 AM
    Author     : pc01
--%>

<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.ProductoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
String usu=null;
String nom=null;
HttpSession sesionOK=request.getSession();
if(sesionOK.getAttribute("perfil")!=null){
nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/Logo_1.jpg"/>
        <title>Modificar</title>
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
        <a class="navbar-brand" href="Index.jsp" ><img width="250"  src="img/LOGO_EMPRESA_1.png" ></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="Index.jsp">Catálogo</a></li>
        <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                <li><a href="Registrar_Producto.jsp">Registrar producto</a></li>
                <% }
                %>
                <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
                    <li><a href="Servlet_logueo?accion=cerrar">Cerrar Sesión</a></li>
                <%}%>
      </ul>      
      <ul class="nav navbar-nav navbar-right" >
          <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
                    <li>
                    <a class="navbar-brand" href="#"><%out.println("Bienvenido: "+nom);%></a></li>
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
      <br>
        <h2 align="center">Actualizar Producto</h2>
        <form action="Servlet_controlador" method="post">
             <%Producto p=ProductoDB.obtenerProducto(request.getParameter("id"));%>
            <table align="center" border="0" width="400">
                <tr>
                    <td colspan="2"><img width="250"  src="img/<%=p.getImagen()%>" ></td>
                </tr>
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="txtCod" value="<%=p.getCod()%>" readonly></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom" value="<%=p.getNombre()%>" minlength="3" maxlength="25" required ></td>
                </tr>
                <tr> 
                    <td>Categoria: </td>
                    <td>
                <select name="Cbx_CAT" size="1">
                <%
                ArrayList<Categoria> ca=CategoriaDB.ListaCategoria();
                for(Categoria d: ca){
                if(p.getId_cat()==d.getId()){
                    %>
                    <option value="<%=d.getId()%>"><%=d.getNombre()%></option>
                    <%
                    }
               
                }
                for(Categoria c: ca){%>
                <option value="<%=c.getId()%>"><%=c.getNombre()%></option>
                <%}%>
                </select>
                </td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="number" name="txtPre" value="<%=p.getPrecio()%>" step="0.1" min="1" max="1500" required ></td>
                </tr>
            </table>
                <br>
                <div align="center"><input type="submit" value="Actualizar" name="btnActualizar" />
                <input type="hidden" name="accion" value="ModificarProducto"/></div>
        </form>
        
    </body>
</html>
