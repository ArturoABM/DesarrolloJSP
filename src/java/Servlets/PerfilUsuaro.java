package Servlets;

import Datos.MostrarDatos;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.xml.ws.WebServiceRef;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import serviciosweb.Persona;
import serviciosweb.WebServiceOP_Service;

/**
 *
 * @author Sistemas
 */
@WebServlet(name = "PerfilUsuaro", urlPatterns = {"/PerfilUsuaro"})
@MultipartConfig
public class PerfilUsuaro extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WebServiceMobileBooth/WebServiceOP.wsdl")
    private WebServiceOP_Service service;

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
//        
//        Part filePart = request.getPart("archivo"); // Retrieves <input type="file" name="file">
//        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
//        
//        File file = new File(fileName);
//        
//        InputStream fileContent = filePart.getInputStream();
        HttpSession SeImg = request.getSession();
        String direccion = request.getParameter("archivo").toUpperCase();

        String a = "";
        String b = "";
        String c = "";
        String d = "";
        String e = "";
        File file = new File(direccion);
        FileInputStream fis = new FileInputStream(file.getAbsolutePath());
//        int tamañoImagen = fis.available();
        SeImg.setAttribute("imgruta", fis);
//        insertarUsuario(a, b, c, d, e, fis);

        response.sendRedirect("GenerarPago.jsp");

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet descriptionz
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String actualizarUsuario(java.lang.String nombre, java.lang.String apellidos, java.lang.String sexo, java.lang.String email, java.lang.String contracena, int idUsuario) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.actualizarUsuario(nombre, apellidos, sexo, email, contracena, idUsuario);
    }

    private String insertarUsuario(java.lang.String nombre, java.lang.String apellidos, java.lang.String sexo, java.lang.String correoElectrinico, java.lang.String contracena, java.lang.String ruta) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.insertarUsuario(nombre, apellidos, sexo, correoElectrinico, contracena, ruta);
    }

}
