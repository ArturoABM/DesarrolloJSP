/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Datos.ExceptcionesCliente;
import Datos.SessionGenerica;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;
import serviciosweb.Persona;
import serviciosweb.WebServiceOP_Service;

/**
 *
 * @author Sistemas
 */
@WebServlet(name = "LogeoUsuario", urlPatterns = {"/LogeoUsuario"})
public class LogeoUsuario extends HttpServlet {

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
        response.setContentType("text/plain");
        ExceptcionesCliente ExecClient = new ExceptcionesCliente();
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String CorreoElectronico = request.getParameter("Email");
        String Contracena = request.getParameter("Contrasena");
        String Accion = request.getParameter("action");
        try {
            Persona usuario = validarUsuario(CorreoElectronico, Contracena);
            int countEmail;
            int countPass;
            int afirm = 1;
            SessionGenerica Sns = new SessionGenerica();
            if (Accion.equals("evento1")) {
                if (usuario != null) {
                 Persona prn  = Sns.Name(Integer.valueOf(usuario.getIdUsuario()),afirm);
                 
                    session.setAttribute("validaUsuario", prn.getNombre());
                     session.setAttribute("Idimagen", usuario.getIdUsuario());
                   out.print("<script> location.href = 'PerfilUsuario.jsp';  </script>");
                } else if (!"".equals(CorreoElectronico) & !"".equals(Contracena)) {
                    out.print("SUS DATOS SON INCORRECTOS");
                }
            } else if (Accion.equals("evento2")) {
                if ("".equals(CorreoElectronico)) {
                    countEmail = 1;
                    session.setAttribute("ElementoDimnamicoEmail", countEmail);
                    out.print("FAVOR DE INGRESAR SU CORREO ELECTRONICO");
                }
            } else if (Accion.equals("evento3")) {
                if ("".equals(Contracena)) {
                    session.setAttribute("ElementoDimnamicoPAss", Contracena);
                    out.print("FAVOR DE INGRESAR SU CONTRACEÑA");
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

    private Persona validarUsuario(java.lang.String correoElectronico, java.lang.String contracena) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.validarUsuario(correoElectronico, contracena);
    }

 }
