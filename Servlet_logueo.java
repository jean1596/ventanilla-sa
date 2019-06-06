/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Utils.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pc01
 */
@WebServlet(name = "Servlet_logueo", urlPatterns = {"/Servlet_logueo"})
public class Servlet_logueo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion=request.getParameter("accion");
        if(accion.equals("loguin")){
        this.Iniciar_Sesion(request,response);
        }else if(accion.equals("cerrar")){
        this.Cerrar_Sesion(request,response);
        }else if(accion.equals("Cancelar")){
        this.Cancelar_Carrito(request,response);
        }
    }
    
     private void Iniciar_Sesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     String usu=request.getParameter("txtUsu");
        String Pas=request.getParameter("txtPsw");
        try{
            CallableStatement cs=Conexion.getConexion().prepareCall("execute U_LOGIN ?,?");
            cs.setString(1, usu);
            cs.setString(2, Pas);
            ResultSet rs=cs.executeQuery();
            if(rs.next()){
            HttpSession sesionOK=request.getSession();
            sesionOK.setAttribute("perfil",(String)rs.getString(4));
            sesionOK.setAttribute("codigo", (String)rs.getString(1));
            sesionOK.setAttribute("nom",(String)rs.getString(2));
            sesionOK.setAttribute("ape",(String)rs.getString(3));
            sesionOK.setAttribute("dir",(String)rs.getString(11));
            request.getRequestDispatcher("Index.jsp").forward(request, response);
            
            }else{
            request.setAttribute("msg", "Error: Verifique su USUARIO O CONTRASEÑA");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        }catch(Exception e){System.out.println(e+"");}
     }
     private void Cerrar_Sesion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     HttpSession sesionOK=request.getSession();
        request.getSession().removeAttribute("perfil");
        request.getSession().removeAttribute("codigo");
        request.getSession().removeAttribute("nom");
        request.getSession().removeAttribute("ape");
        request.getSession().removeAttribute("dir");
        sesionOK.invalidate();
        request.getRequestDispatcher("Index.jsp").forward(request, response);
     }
     private void Cancelar_Carrito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
     HttpSession sesion=request.getSession();
        request.getSession().removeAttribute("carrito");
        request.getRequestDispatcher("Index.jsp").forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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

}
