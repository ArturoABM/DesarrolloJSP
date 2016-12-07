/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "GenerarOrden", urlPatterns = {"/GenerarOrden"})
public class GenerarOrden extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");

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

        HttpSession SessionId = request.getSession();
        try {
            Persona Per = null;
            Per = (Persona) SessionId.getAttribute("DcPersona");
            String CmbEstOrigen = request.getParameter("DtEstadoOrg");
            String CmbMunOrigen = request.getParameter("DtMunicipioOrg");
            String CmbEstDestuno = request.getParameter("DtoEstadoDsn");
            String CmbMunDestino = request.getParameter("DtoMunicipioDsn");
            String Conductor = request.getParameter("Conductor");
            String TpTransporte = request.getParameter("TpAutomovil");
            String TLicencia = request.getParameter("TpLicencia");
            String Orden = insertOrden(Integer.valueOf(Per.getIdUsuario()), Per.getNombre(), Per.getApellidos(), CmbEstOrigen, CmbMunOrigen, CmbEstDestuno, CmbMunDestino, Conductor, TpTransporte, TLicencia);
            SessionId.setAttribute("PersonaQR", Per);
            response.sendRedirect("CodeQR.jsp");
        } catch (Exception e) {
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

    private Persona nameID(int id) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.nameID(id);
    }

    private String insertOrden(int id, java.lang.String nombre, java.lang.String apellido, java.lang.String estOrigen, java.lang.String munOrigen, java.lang.String estDestino, java.lang.String munDestino, java.lang.String conductor, java.lang.String tipoTransporte, java.lang.String tipoLicencia) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.insertOrden(id, nombre, apellido, estOrigen, munOrigen, estDestino, munDestino, conductor, tipoTransporte, tipoLicencia);
    }

}
