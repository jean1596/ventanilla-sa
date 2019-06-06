<%-- 
    Document   : Agrega_categoria
    Created on : 29/04/2019, 11:12:24 PM
    Author     : pc01
--%>

<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="java.util.ArrayList"%>
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
          <li><a href="Index.jsp">Categoria</a>
              <ul>
                  <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                  <li><a href="Agrega_categoria.jsp">Añadir Categoria</a></li>
                <% }
                  ArrayList<Categoria> ca=CategoriaDB.ListaCategoria();
                for(Categoria c: ca){%>
                <li><a href="Filtro.jsp?id=<%=c.getId()%>"><%=c.getNombre()%></a></li>
                  <%}%>
              </ul>
          </li>
          
          
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
      <h1 align="center">Lista de Nuestras Categorias</h1>
      <form action="" name="frm1" align="center">
      <table align="center" width="250" border="1">
          <tr bgcolor="#27E1C2">
              <td>Id</td>
              <td>Nombre</td>
              <td>Estado</td>
          </tr>
          <%
              ArrayList<Categoria> ls=new ArrayList<>();
              ls=CategoriaDB.ListaCategoria();
              for(Categoria c:ls){
          %>
          <tr>
              <td><%=c.getId()%></td>
              <td><%=c.getNombre()%></td>
              <td><%=c.getEst()%></td>
          </tr>
          <%}%>
      </table>
      <br>
      <br>
      <input type="submit" name="btnAgrega" value="Agregar Categoria" title="Clic aqui para agregar una categoria">
      </form>
      <%
      if(request.getParameter("btnAgrega")!=null){
      %>
      <hr>
      <form action="Servlet_controlador" method="get" align="center">
      <p>Ingrese Nombre de la Categoria: </p>
      <input type="text" name="txtN_cat"/>
      <input type="submit" value="Registrar"/>
      <input type="hidden" name="accion" value="RegistrarCategoria"/>
      </form>
      
      <%}%>
      
      
      
    </body>
</html>
