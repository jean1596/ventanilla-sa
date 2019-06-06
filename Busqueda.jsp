

<%@page import="Modelo.CategoriaDB"%>
<%@page import="Modelo.Categoria"%>
<%@page import="Modelo.ProductoDB"%>
<%@page import="java.util.ArrayList"%>
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
      <br>
      <br>
      <br>
      <section id="producto">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <div class="titulo">
                           <h2>Catálogo de Productos</h2>
                           <div class="hr"></div>
                       </div>
                       <form action="Busqueda.jsp">
                       <input type="text" name="txtN" placeholder="Buscar" />
                       <input type="submit" name="btnBuscar" value="BUSCAR"/>
                       <br>
                       <br>
                       
                       </form>
                   </div>
      <%
          String B=request.getParameter("txtN");
            ArrayList<Producto> List=null;
            if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){
            List=ProductoDB.BuscarProductoADMIN(B);
            }else{
            List=ProductoDB.BuscarProducto(B);
            }
            int salto=0;
            for(Producto p:List){
            %>
             <div class="col-sm-4 col-lg-4 col-md-4" wi >
                        <div class="thumbnail text-center">                            
                            <img src="img/<%=p.getImagen()%>" class="img-responsive" alt="">
                            <div class="caption">
                                <h4 class="pull-right precio">s/ <%=p.getPrecio()%></h4>
                                <h4><a href="Ver_PROD.jsp?Id=<%=p.getCod()%>"><%=p.getNombre()%></a>
                                </h4>
                                
                                <%if(sesionOK.getAttribute("perfil")!=null && sesionOK.getAttribute("perfil").equals("Administrador")){%>
                                <h4><p> Estado: <%=p.getEstado()%><p></h4>
                                
                                <a class="btn btn-primary" href="ActualizarProducto.jsp?id=<%=p.getCod()%>">Editar</a>
                                <a class="btn btn-primary" href="Servlet_controlador?id=<%=p.getCod()%>&Est=<%=p.getEstado()%>&accion=CambiarEstado">Cambiar Estado</a>
                                <%if(p.getStock()==0){%>
                                <a class="btn alert-warning"   title="Producto Sin Stock">Abastecer</a>
                                <%}else{%>
                                <a class="btn btn-primary" >Abastecer</a>
                                <%}%>
                                
                    <%}else{%>
                    <a class="btn btn-primary" <%if(sesionOK.getAttribute("perfil")==null ){%>href="Login.jsp"<%}else{%>href="Agregar_carrito.jsp?id=<%=p.getCod()%><%}%>">Comprar</a>
                    <%}%>
                        </div>                                
                        </div>
                    </div>
                   <%}%>
                 </section>  
      <script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/code.js"></script> 


<table border="0" align="center">
    <tr >
        <th>Contactenos: </th>
        <th><img width="50"  src="img/cellPhone.png" > 6063359 </th>
        <th><img width="50"  src="img/gmail.png" > AuropartesVentanilla@gmail.com</th>
    </tr>
</table>
    </body>
</html>
