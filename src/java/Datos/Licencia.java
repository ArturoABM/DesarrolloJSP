/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import serviciosweb.TLicencia;

/**
 *
 * @author Sistemas
 */
public class Licencia {

    public TLicencia ListaLicencia(int j) {
        try {
            TLicencia es = null;
           
             es = licencName(j);
            return es;
        } catch (Exception e) {
        }
        return null;

    }

    private static TLicencia licencName(int idli) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.licencName(idli);
    }

}
