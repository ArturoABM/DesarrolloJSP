package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Datos.ExceptcionesCliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import serviciosweb.WebServiceOP_Service;

/**
 *
 * @author Sistemas
 */
@WebServlet(urlPatterns = {"/PaginaPrincipal"})
public class PaginaPrincipal extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WebServiceMobileBooth/WebServiceOP.wsdl")
    private WebServiceOP_Service service;

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
        
        ExceptcionesCliente ExecClient = new ExceptcionesCliente();
        PrintWriter out = response.getWriter();
        response.setContentType("text/plain");
        String NombreUsuario = request.getParameter("Nombre");
        String ApellidosUsuario = request.getParameter("Apellidos");
        String SexoUsuario = request.getParameter("Sexo");
        String EmailUsuario = request.getParameter("Email");
        String ContracenaUsuario = request.getParameter("Contrasena");
        String Action = request.getParameter("action");
        String Ruta = "C:\\Users\\Sistemas\\Documents\\NetBeansProjects\\ConsumoWebServiceMobileBooth\\web\\img\\man (4).png";
           
        try {
             if (Action.equals("evento1")) {
            if (!"".equals(NombreUsuario) & !"".equals(ApellidosUsuario) & !"".equals(SexoUsuario)
                    & !"".equals(EmailUsuario) & !"".equals(ContracenaUsuario)) {
                String Datos = insertarUsuario(NombreUsuario, ApellidosUsuario, SexoUsuario, EmailUsuario, ContracenaUsuario,Ruta);
                out.print("HA SIDO REGISTRADO CORRECTAMENTE");
            }
        } else if (Action.equals("evento2")) {
            if ("".equals(NombreUsuario)) {
                out.print("FAVOR DE INGRESAR SU NOMBRE");
            }
        } else if (Action.equals("evento3")) {
            if ("".equals(ApellidosUsuario)) {
                out.print("FAVOR DE INGRESAR SUS APELLIDOS");
            }
        } else if (Action.equals("evento4")) {
            if ("".equals(EmailUsuario)) {
                out.print("FAVOR DE INGRESAR UN CORREO ELECTRONICO");
            }
        } else if (Action.equals("evento5")) {
            if ("".equals(ContracenaUsuario)) {
                out.print("FAVOR DE INGRESAR UNA CONTRACEÑA");
            }
        }

        } catch (Exception ex) {
             
            StackTraceElement[] trace = ex.getStackTrace();
            ExecClient.ExepcionesEmail(trace);
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

    private String insertarUsuario(java.lang.String nombre, java.lang.String apellidos, java.lang.String sexo, java.lang.String correoElectrinico, java.lang.String contracena, java.lang.String ruta) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.insertarUsuario(nombre, apellidos, sexo, correoElectrinico, contracena, ruta);
    }


  

}
