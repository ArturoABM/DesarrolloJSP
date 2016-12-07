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
public class EstLista {

    public List<Estado> StEstado() {
        try {
            List<Estado> Est = null;
            Est = cmbEstado();
            return Est;
        } catch (Exception e) {
        }
        return null;
    }

    public List<TpAuto> Automovil() {
        try {
            List<TpAuto> Autdt = null;
            Autdt = tpAutoUser();
            return Autdt;
        } catch (Exception e) {
        }
        return null;
    }

    public List<TLicencia> Licencia() {
        try {
            List<TLicencia> lic = null;
            lic = tpLicenciaConductor();
            return lic;
        } catch (Exception e) {
        }
        return null;
    }

    private static java.util.List<serviciosweb.Estado> cmbEstado() {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.cmbEstado();
    }

    private static java.util.List<serviciosweb.TLicencia> tpLicenciaConductor() {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.tpLicenciaConductor();
    }

    private static java.util.List<serviciosweb.TpAuto> tpAutoUser() {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.tpAutoUser();
    }
}
