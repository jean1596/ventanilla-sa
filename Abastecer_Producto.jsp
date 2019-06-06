

<%@page import="Modelo.*"%>
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
        <main>
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
                  <li ><a href="Filtro.jsp?id=<%=c.getId()%>"><%=c.getNombre()%></a></li>
                  <%}%>
              </ul>
          </li>
          
          
        <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                <li><a href="Registrar_Producto.jsp">Registrar producto</a></li>
                <li><a href="Index.jsp">Reportes</a>
                <ul>
                    <li><a href="Ventas_del_dia.jsp?op=1">Ventas de hoy</a></li>
                    <li><a href="Ventas_del_dia.jsp?op=2">Cliente del mes</a></li>
                    
                    <li><a href="Ventas_del_dia.jsp?op=3">Prod. Más Vendido</a></li>
                </ul>
                    </li>
                <% }
                %>
                <%if(sesionOK.getAttribute("perfil")!=null){
                    %>
                <li><a href="RegistrarVenta.jsp">Ver Carrito</a></li>
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
                    <td>Stock actual: </td>
                    <td><%=p.getStock()%></td>
                </tr>
                <tr>
                    <td>Cantidad a Agregar: </td>
                    <td><input type="number" name="N_stock" title="Seleccione el numero de productos" value="1" min="1" max="500" required /></td>
                </tr>
            </table>
                <br>
                <input type="hidden" name="C_PROD" value="<%=p.getCod()%>" />
                <input type="hidden" name="accion" value="Abastecer_Producto" />
                <h4 align="center"><input type="submit" name="Btn_Abast" value="Abastecer" /></h4>
        </form>
      
        </main>
    </body>
</html>
