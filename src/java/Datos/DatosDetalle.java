/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import serviciosweb.ResultadoProcedure;

/**
 *
 * @author Sistemas
 */
public class DatosDetalle {
    
    
    public ResultadoProcedure DatoProPErson(String Data){
        try {
            ResultadoProcedure ProcedimientoAD = detaPerson(Data);
            return ProcedimientoAD;
        } catch (Exception e) {
        }
        return null;
    }
    

    private static ResultadoProcedure detaPerson(java.lang.String code) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.detaPerson(code);
    }
    
    
}
