<%-- 
    Document   : RegistrarVenta
    Created on : 05/05/2019, 05:44:55 PM
    Author     : pc01
--%>

<%@page import="Modelo.*"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        </main>
        
        <%
         ArrayList<DetalleVenta> List=(ArrayList<DetalleVenta>)session.getAttribute("carrito");    
        if(sesionOK.getAttribute("carrito")==null || List.size()==0){
        %>
        <div align="center">
        <img width="80"  src="img/Carrito.png">
        <h2 align="center"> No tienes productos en tu carrito :(</h2>
        <hr width="50%"/>
        <a class="btn btn-primary" href="index.jsp">Comprar Ahora</a>
        </div>
        <%}else{%>
        <h2 align="center">Carrito de Compras</h2>
        <form method="get" >
            <table align="center" width="800">
                <input type="hidden" name="txtCodUsu" value="<%
                        if(sesionOK.getAttribute("perfil")!=null)
                        out.println(C_USU);%>" readonly="readonly">
                <input type="hidden" name="txtDirection" value="<%
                        if(sesionOK.getAttribute("perfil")!=null)
                        out.println(direc);%>" readonly="readonly">
                <tr bgcolor="#27E1C2" align="center">
                    <td>Imagen: </td>
                    <td>Nombre: </td>
                    <td>Precio: </td>
                    <td>Cantidad: </td>
                    <td>Sub. Total: </td>
                </tr>
                <%
                double total=0;
                double Tot_c_envio=0;
                ArrayList<DetalleVenta> lista=(ArrayList<DetalleVenta>)session.getAttribute("carrito");
                if(lista!=null){
                    for(DetalleVenta d:lista){
                %>
                <tr align="center" rowspan="5">
                    <td><img width="50"  src="img/<%=d.getProducto().getImagen()%>" ></td>
                    <td><%=d.getProducto().getNombre()%></td>
                    <td><%=String.format("%.2f",d.getProducto().getPrecio())%></td>
                    <td><%=d.getCantidad()%></td>
                    <td><%=String.format("%.2f",d.getTotal())%></td>
                    <td><a href="Servlet_controlador?ID=<%=d.getProducto().getCod()%>&accion=Quitar_de_carrito" title="Quitar este producto del carrito">
                            <img width="25"  src="img/Eliminar.png" ></a></td>
                </tr>
                <%
                    total=total+d.getTotal();
                    }
                }
                Tot_c_envio=(0.1*total)+total;
                %>
                <tr align="center" bgcolor="#27E1C2">
                    <td colspan="4" align="right">Sub Total</td>
                    <td><%=String.format("%.2f",total)%></td>
                </tr>
                <tr align="center" bgcolor="#27E1C2">
                    <td colspan="4" align="right">Precio con Envío (10%+) </td>
                    <td><%=String.format("%.2f",Tot_c_envio)%></td>
                </tr>
            </table> 
            </form>
            <br>
            <br>
            <%String T_Ent=request.getParameter("CbxT_Ent");%>
                <form action="https://www.sandbox.paypal.com" method="get" align="center">

<input type="hidden" name="cmd" value="_ext-enter" />
<input type="hidden" name="redirect_cmd" value="_xclick" />
<input type="hidden" name="business" value="ventanilla_sa@gmail.com" />
<input type="hidden" name="item_name" value="Productos varios" />
<input type="hidden" name="quantity" value="1" />
<input type="hidden" name="amount" value="<%=Tot_c_envio%>" />
<input type="hidden" name="currency_code" value="USD" />
<input type="hidden" name="return" value="https://autopartes-ventanilla.azurewebsites.net/Servlet_controlador?accion=RegistrarVenta&txtCodUsu=<%=C_USU%>&txtDirection=<%=direc%>" />
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest" />
<input type="image" src="img/PayPal.png" border="0" name="submit" alt="Pagar para completar la compra." width="200" />

              </form>
                <div>
                    <h3 align="center"><a href="index.jsp">Seguir Comprando</a>||
                    <a href="Servlet_logueo?accion=Cancelar">Cancelar Compra</a></h3>
                </div>   
                <%}%>
    </body>
</html>
