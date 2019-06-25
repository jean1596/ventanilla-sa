package Controlador;


import Modelo.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import org.apache.commons.fileupload.FileItem;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
/**
 *
 * @author pc01
 */
@WebServlet(name = "Servlet_controlador", urlPatterns = {"/Servlet_controlador"})
public class Servlet_controlador extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        String  accion=request.getParameter("accion");
        if(accion.equals("ModificarProducto")){
        this.ActualizarProducto(request,response);
        }else if(accion.equals("SubirImagen")){
        this.SubirImagen(request, response);
        }else if(accion.equals("RegistrarProducto")){
        this.AñadirProducto(request, response);
        }else if(accion.equals("RegistrarCategoria")){
        this.AñadirCategoria(request, response);
        }else if(accion.equals("CambiarEstado")){
        this.CambiarEstado(request,response);
        }else if(accion.equals("RegistrarUsuario")){
        this.AñadirUsuario(request, response);
        }else if(accion.equals("AgregarCarrito")){
        this.AgregarCarrito(request,response);
        }else if(accion.equals("RegistrarVenta")){
        this.RegistrarVenta(request,response);
        }else if(accion.equals("Quitar_de_carrito")){
        this.QuitarDeCarrito(request,response);
        }else if(accion.equals("Abastecer_Producto")){
        this.Abastecer_Producto(request,response);
        }else if(accion.equals("Cambiar_Estado_Pedido")){
        this.Camb_Estado_Pedido(request,response);
        }
    }
    
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(Servlet_controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(Servlet_controlador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void ActualizarProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cod=request.getParameter("txtCod");
        String nom=request.getParameter("txtNom");
        int id_cat=Integer.parseInt(request.getParameter("Cbx_CAT"));
        float pre=Float.parseFloat(request.getParameter("txtPre"));
        
        Producto p=new Producto(cod,nom,id_cat,pre);
       boolean rpta=ProductoDB.actualizarProducto(p);
       if(rpta=true){
       response.sendRedirect("mensaje.jsp?men=Se Actualizo el producto Correctamente");
       }else{response.sendRedirect("mensaje.jsp?men=No se actualizo el producto");}
    }
    private void SubirImagen(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, FileUploadException{
        FileItemFactory file_factory=new DiskFileItemFactory();
ServletFileUpload servlet_up=new ServletFileUpload(file_factory);
List items=servlet_up.parseRequest(request);
String img="";
for(int i=0;i<items.size();i++){
FileItem item=(FileItem) items.get(0);
if(!item.isFormField()){
File archivo_server = new File("C:\\VENTANILLA_SA\\web\\img\\"+item.getName());
try{
item.write(archivo_server);
}catch(Exception e){}
img=item.getName();
}
img=item.getName();
}
response.sendRedirect("RegistrarProducto2.jsp?img="+img);
    }
    private void AñadirProducto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    String nombre=request.getParameter("txtNom");
    int cat=Integer.parseInt(request.getParameter("Cbx_CAT"));
    float precio=Float.parseFloat(request.getParameter("txtPrecio"));
    String imagen=request.getParameter("txtImagen");
    Producto p=new Producto(nombre,cat,precio,imagen);
    boolean rpta=ProductoDB.AñadirProd(p);
    if(rpta=true){
       response.sendRedirect("mensaje.jsp?men=Se registro el producto Correctamente");
       }else{response.sendRedirect("mensaje.jsp?men=No se registro el producto");}
    }
    private void AñadirCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    String nom=request.getParameter("txtN_cat");
    CategoriaDB.A_cat(nom);
       response.sendRedirect("Agrega_categoria.jsp");
    }
    private void AñadirUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    String nombre=request.getParameter("txtNom");
     String Apellido=request.getParameter("txtApe");
     String Correo=request.getParameter("txtCorreo");
     String Phone=request.getParameter("txtPhone");
     String Direc=request.getParameter("txtDirec");
     String Contra=request.getParameter("txtContra");
     

    boolean rpta=UsuarioDB.AgregarUSU(nombre, Apellido, Correo, Phone, Contra, Direc);
    if(rpta=true){
       response.sendRedirect("mensaje.jsp?men=Usuario Registrado Exitosamente ");
       }else{response.sendRedirect("mensaje.jsp?men=No se pudo Registrar el usuario");}
    }
    private void CambiarEstado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    String Estado=request.getParameter("Est");
String Cod=request.getParameter("id");
if(Estado.equals("A")){
    Estado="I";
}else if(Estado.equals("I")){
Estado="A";
}
boolean rpta=ProductoDB.CambiarEstado(Cod, Estado);
if(rpta=true){
       response.sendRedirect("Index.jsp");
       }
    }
    private void AgregarCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    HttpSession sesion=request.getSession();
    ArrayList<DetalleVenta> carrito;
    if(sesion.getAttribute("carrito")==null){
    carrito=new ArrayList<DetalleVenta>();
    }else{
     carrito= (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
    }
    Producto p=ProductoDB.obtenerProducto(request.getParameter("txtCod"));
    DetalleVenta d=new DetalleVenta();
    d.setCod_pro(p.getCod());
    d.setProducto(p);
    d.setCantidad(Integer.parseInt(request.getParameter("txtCant")));
    float total=p.getPrecio()*d.getCantidad();
    d.setTotal(total);
    int indice=-1;
    for(int i=0;i<carrito.size();i++){
    DetalleVenta det=carrito.get(i);
    if(det.getCod_pro().equals(p.getCod())){
    indice=i;
    break;
    }
    }
    if(indice==-1){
    carrito.add(d);
    }
    sesion.setAttribute("carrito", carrito);
    response.sendRedirect("RegistrarVenta.jsp");
    }
    
    private void RegistrarVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    HttpSession sesion=request.getSession();
    Venta v=new Venta();
    v.setCod_usu(request.getParameter("txtCodUsu").toUpperCase());
    v.setDireccion(request.getParameter("txtDirection"));
    ArrayList<DetalleVenta> detalle=(ArrayList<DetalleVenta>)sesion.getAttribute("carrito");
    boolean rpta=VentaDB.AñadirVenta(v, detalle);
    if(rpta){
    request.getSession().removeAttribute("carrito");
    response.sendRedirect("mensaje.jsp?men=Venta realizada Correctamente");
    }else{
        response.sendRedirect("mensaje.jsp?men=No se pudo registrar la venta");  
    }
    }
    private void QuitarDeCarrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    ArrayList<DetalleVenta> carrito;
    HttpSession sesion=request.getSession();
    String codigo=request.getParameter("ID");
    carrito= (ArrayList<DetalleVenta>) sesion.getAttribute("carrito");
    for(int i=0;i<carrito.size();i++){
    DetalleVenta det=carrito.get(i);
    if(det.getCod_pro().equals(codigo)){
    carrito.remove(det);
    }
    }
    response.sendRedirect("RegistrarVenta.jsp");
    }
    private void Abastecer_Producto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String cod=request.getParameter("C_PROD");
        int cant=Integer.parseInt(request.getParameter("N_stock"));
        
       boolean rpta=ProductoDB.Abastecer(cod, cant);
       if(rpta=true){
       response.sendRedirect("mensaje.jsp?men=Producto Abastecido");
       }else{response.sendRedirect("mensaje.jsp?men=Error: Producto no Abastecido");}
    }
    private void Camb_Estado_Pedido(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    int cod_ped=Integer.parseInt(request.getParameter("id_Ped"));
    VentaDiaDB.Cambiar_est_pedido(cod_ped);
    response.sendRedirect("Ventas_del_dia.jsp?op=6");
    }
}
