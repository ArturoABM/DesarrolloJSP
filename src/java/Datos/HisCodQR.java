/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.List;
import serviciosweb.CodeQR;

/**
 *
 * @author Sistemas
 */
public class HisCodQR {

    public List<CodeQR> QRADDLIST(int id){       
        try {
        List<CodeQR> list= (List<CodeQR>)documentQR(id);    
        return list;
        } catch (Exception e) {
            
        }
        return null;
    }
    private static java.util.List<serviciosweb.CodeQR> documentQR(int id) {
        serviciosweb.WebServiceOP_Service service = new serviciosweb.WebServiceOP_Service();
        serviciosweb.WebServiceOP port = service.getWebServiceOPPort();
        return port.documentQR(id);
    }
    
    
   

    
}
