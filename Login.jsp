
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="icon" type="image/png" href="img/Logo_1.jpg"/>
        <title>Iniciar Sesion</title>
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
      </ul>      
      <ul class="nav navbar-nav navbar-right" >
      </ul>
    </div>
  </div>
</nav>
<section id="producto">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                       <div class="titulo">
                           <h2>Logueo de Usuarios</h2>
                           <div class="hr"></div>
                       </div>
                   </div>
        <table border="0" width="300" align="center">
            <form action="Servlet_logueo" method="post">
                <input type="hidden" name="accion" value="loguin"/>
                <tr>
                    <td>Usuario: </td>
                    <td><input type="text" placeholder="Ejemplo@ejemplo.com" name="txtUsu" minlength="3" maxlength="100" required/></td>
                </tr>
                <tr>
                    <td>Password: </td>
                    <td><input type="Password" placeholder="Contraseña" name="txtPsw" minlength="3" maxlength="100" required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" ><input type="submit" name="btn" value="Iniciar Sesion"/></td>
                </tr>
                 
                           
            </form>
        </table>
        <h4 align="center">
         <%
             if(request.getAttribute("msg")!=null){
             out.println(request.getAttribute("msg"));
             }
         %>   
         </h4>
         <form >
             <table align="center">
             <tr>
                 <th colspan="15">Si no estas Registrado Presiona aqui --> <a href="Registrar_Usu.jsp" >Registrarse</a></th>
                </tr>
         </table>
         </form>
         
    </body>
</html>
