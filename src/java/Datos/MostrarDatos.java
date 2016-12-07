/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.jsp.JspWriter;
import serviciosweb.Persona;

/**
 *
 * @author Sistemas
 */
public class MostrarDatos {

    public String MostrarDatos(ArrayList<Persona> FlujoDt, JspWriter out) throws IOException {

        for (int i = 0; i < FlujoDt.size(); i++) {

            out.print("<tr>");
            out.print("<td>" + FlujoDt.get(i).getNombre() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getApellidos() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getCorreoElectronico() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getSexo() + "</td>");
            out.print("<td><a  id='DeleteUser'  class='btn btn-danger btn-default'   href='PerfilUsuario.jsp?eliminar=" + FlujoDt.get(i).getIdUsuario() + "'> Delete User</a></td>");
            out.print("<td><a class='btn btn-success btn-default'  href='PerfilUsuario.jsp?actualizar=" + FlujoDt.get(i).getIdUsuario() + "'>Update User</a></td>");
            out.print("</tr>");

        }
        return "";
    }

    public String MostrarDatosAction(ArrayList<Persona> FlujoDt, PrintWriter out) throws IOException {
        out.print("<table  class='table'  id='divtbl'  border='1'>");
        out.print("<tr class='info'>");
        out.print("<td>Nombre</td>");
        out.print("<td>Apellidos</td>");
        out.print("<td>Correo Electronico</td>");
        out.print("<td>Sexo</td>");
        out.print("<td>Eliminar Usuario</td>");
        out.print("<td>Actualizar Usuario</td>");
        out.print("</tr>");

        for (int i = 0; i < FlujoDt.size(); i++) {

            out.print("<tr>");
            out.print("<td>" + FlujoDt.get(i).getNombre() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getApellidos() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getCorreoElectronico() + "</td>");
            out.print("<td>" + FlujoDt.get(i).getSexo() + "</td>");
            out.print("<td><a  id='DeleteUser'  class='btn btn-danger btn-default'  href='PerfilUsuario.jsp?eliminar=" + FlujoDt.get(i).getIdUsuario() + "'> Delete User</a></td>");
            out.print("<td><a class='btn btn-success btn-default'  href='PerfilUsuario.jsp?actualizar=" + FlujoDt.get(i).getIdUsuario() + "'>Update User</a></td>");
            out.print("</tr>");

        }
        out.print("</table>");
        return "";
    }

}
