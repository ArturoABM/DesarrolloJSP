/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 *
 * @author Sistemas
 */
public class UpdateImg {

    public boolean UpdateImage(String nombre, String apellidos, String sexo, String email, String contracena, int idUsuario, String rutaImg) {
        boolean ReImg = false;
        try {
            String Update = actualizarUsuarioImg(nombre, apellidos, sexo, email, contracena, idUsuario, rutaImg);
        } catch (Exception e) {
        }
        return ReImg;
    }

    private static String actualizarUsuarioImg(java.lang.String nombre, java.lang.String apellidos, java.lang.String sexo, java.lang.String email, java.lang.String contracena, int idUsuario, java.lang.String rutaImg) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.actualizarUsuarioImg(nombre, apellidos, sexo, email, contracena, idUsuario, rutaImg);
    }

}
