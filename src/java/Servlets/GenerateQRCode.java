/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Datos.GeneradorCodigoQR;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.WebServiceRef;
import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.image.ImageType;
import serviciosweb.OrdenQR;
import serviciosweb.Persona;
import serviciosweb.WebServiceOP_Service;

/**
 *
 * @author Sistemas
 */
public class GenerateQRCode extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/WebServiceMobileBooth/WebServiceOP.wsdl")
    private WebServiceOP_Service service;

    public String CodigoQRIdentity = "";
    public Persona per = null;
    public int id;

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
        HttpSession SesionLP = request.getSession();
        per = (Persona) SesionLP.getAttribute("PersonaQR");
        String qrText = per.getNombre();
        id = Integer.valueOf(per.getIdUsuario());
        GeneradorCodigoQR QR = new GeneradorCodigoQR();
        if (qrText != null) {
            CodigoQRIdentity = QR.CodigoAlfaNo();
            ByteArrayOutputStream out = QRCode.from(CodigoQRIdentity).to(ImageType.PNG).withSize(450, 450).stream();
            response.setContentType("image/png");
            try (OutputStream os = response.getOutputStream()) {
                os.write(out.toByteArray());
                os.flush();
                SesionLP.setAttribute("CQR", CodigoQRIdentity);
            }
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
        processRequest(request, response);
        OrdenQR list = numeroFinal();
        if (list != null) {
            String Cod = qRcode(list.getUsuarioid(), list.getOrdenId(), CodigoQRIdentity);
            response.sendRedirect("PerfilUsuario.jsp");
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

    private String qRcode(int id, int idOrden, java.lang.String code) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.qRcode(id, idOrden, code);
    }

    private OrdenQR numeroFinal() {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.numeroFinal();
    }

}
