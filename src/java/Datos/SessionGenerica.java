/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import serviciosweb.Persona;

public class SessionGenerica {

    public String SessionGenerica(String Session) {
        if (Session != null) {
            return Session;
        }
        return Session;
    }

    public Persona Name(int id, int afirmacion) {
        Persona i = null;
        try {
            if (id > 0 && afirmacion > 0) {
                i = nameID(id);
            }
            return i;
        } catch (Exception e) {
        }

        return i;
    }

    private static Persona nameID(int id) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.nameID(id);
    }

}
