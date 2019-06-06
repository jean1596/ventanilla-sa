<%-- 
    Document   : Ver_PROD
    Created on : 28/04/2019, 10:37:57 PM
    Author     : pc01
--%>

<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.ProductoDB"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String usu=null;
String nom=null;
HttpSession sesionOK=request.getSession();
if(sesionOK.getAttribute("perfil")!=null){
nom=(String)sesionOK.getAttribute("nom")+" "+(String)sesionOK.getAttribute("ape");
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
      <div class="titulo">
          <br>
          <br>
          <br>
        <h2 align="center">Detalle de Producto</h2>
      <div class="hr"></div>
      </div>
        
        <form action="Servlet_controlador" method="post">
             <%Producto p=ProductoDB.obtenerProducto(request.getParameter("Id"));%>
            <table align="center" border="0" width="200">
                <tr>
                    <td colspan="2"><img width="250"  src="img/<%=p.getImagen()%>" ></td>
                </tr>
                <tr>
                    <td>Codigo: </td>
                    <td><%=p.getCod()%></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><%=p.getNombre()%></td>
                </tr>
                <tr>
                    <td>Categoria: </td>
                    <%String ncat=CategoriaDB.Nom_cat(p.getId_cat());%>
                    <td><%=ncat%></td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><%=p.getPrecio()%></td>
                </tr>
                <tr>
                    <td>Stock: </td>
                    <td><%=p.getStock()%></td>
                </tr>
            </table>
                <br>
                <div align="center"><a class="btn btn-primary" <%if(sesionOK.getAttribute("perfil")==null){%>href="Login.jsp"<%}else{%>href="Agregar_carrito.jsp?id=<%=p.getCod()%><%}%>">Comprar</a></div>
                
        </form>
                
                
 <script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/code.js"></script> 
<br>
<br>
<br>
<table border="0" align="center">
    <tr >
        <th>Contactenos: </th>
        <th><img width="50"  src="img/cellPhone.png" > 6063359 </th>
        <th><img width="50"  src="img/gmail.png" > AuropartesVentanilla@gmail.com</th>
    </tr>
</table>
    </body>
</html>
