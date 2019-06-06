<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Utils.Conexion"%>
<%@page import="java.sql.CallableStatement"%>
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
        <a class="navbar-brand" href="Index.jsp" ><img width="250"  src="img/LOGO_EMPRESA_1.png" ></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
          <li><a href="Index.jsp">Catálogo</a></li>
        <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                <li><a href="Servlet_logueo?accion=cerrar">Cerrar Sesión</a></li>
                <% }%>
                
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
        <h2 align="center">Registrar Producto</h2>
        <br>
        <br>
        <form class="form-horizontal" action="Servlet_controlador" method="get">
            <table border="0" width="350" align="center">
                <%
                String imagen=request.getParameter("img");
                String cod=null;
                try{
                CallableStatement cs=Conexion.getConexion().prepareCall("execute G_COD_PROD");
                ResultSet rs=cs.executeQuery();
                while(rs.next()){
                cod=rs.getString(1);
                }
                }catch(Exception e){}
                %>
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="txtCod" value="<%=cod%>" readonly/></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtNom" placeholder="Entre 3 y 40 caracteres" minlength="3" maxlength="40" required /></td>
                </tr>
                <tr> 
                    <td>Categoria: </td>
                    <td colspan="2">
                <select name="Cbx_CAT" size="1">
                <%
                ArrayList<Categoria> ca=CategoriaDB.ListaCategoria();
                for(Categoria c: ca){
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
