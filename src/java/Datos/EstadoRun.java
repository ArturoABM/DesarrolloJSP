/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.ArrayList;
import java.util.List;
import serviciosweb.Estado;
import serviciosweb.TLicencia;
import serviciosweb.TpAuto;

/**
 *
 * @author Sistemas
 */
public class EstadoRun {

    public Estado ListaEstado(int i) {

        Estado est = estadoname(i);
        return est;
    }
    
    public TpAuto ListaAuto(int p) {

        TpAuto TP = automovilName(p);
        return TP;
    }
     


    private static Estado estadoname(int id) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.estadoname(id);
    }

    private static TpAuto automovilName(int id) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.automovilName(id);
    }
}
