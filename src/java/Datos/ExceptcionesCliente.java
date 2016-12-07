/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.ArrayList;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Sistemas
 */
public class ExceptcionesCliente {
    public String ExepcionesEmail(StackTraceElement[] lista) {
        String Msj = null;
        try {
            ArrayList<String> Mensaje = new ArrayList<String>();
            for (int i = 0; i < lista.length; i++) {
                Mensaje.add("informacion : " + lista[i].toString() + "\n");
            }
            String de = "sistemamoobile@gmail.com";
            String clave = "sistemaalerta";
            String para = "arturo.bravo.martinez05@gmail.com";
            String Asunto = "Alerta de excepciones del Cliente";
            String host = "smtp.gmail.com";
            Properties prop = System.getProperties();
            prop.put("mail.smtp.starttls.enable", "true");
            prop.put("mail.smtp.host", host);
            prop.put("mail.smtp.user", de);
            prop.put("mail.smtp.password", clave);
            prop.put("mail.smtp.port", 587);
            prop.put("mail.smtp.auth", "true");

            Session session = Session.getDefaultInstance(prop, null);
            MimeMessage menssage = new MimeMessage(session);

            menssage.setFrom(new InternetAddress(de));
            menssage.setRecipient(Message.RecipientType.TO, new InternetAddress(para));
            menssage.setSubject(Asunto);
            menssage.setText(Mensaje.toString());

            Transport transport = session.getTransport("smtp");
            transport.connect(host, de, clave);
            transport.sendMessage(menssage, menssage.getAllRecipients());
            transport.close();
            Msj = "Envio Correcto";

        } catch (Exception e) {
            e.getMessage();
        }
        return Msj;
    }
}
