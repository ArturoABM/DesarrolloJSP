/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.util.Random;

/**
 *
 * @author Sistemas
 */
public class GeneradorCodigoQR {

    public String CodigoAlfaNo() {

        Random rnd = new Random();
        String abecedario = "ABCDEFGHIJKLMOPQRSTUVWXYZ";
        String cadena = "";
        String Return ="";
        int m = 0, pos = 0, num;
        while (m < 1) {
            pos = (int) (rnd.nextDouble() * abecedario.length() - 1 + 0);
            num = (int) (rnd.nextDouble() * 9999 + 1000);
            cadena = cadena + abecedario.charAt(pos) + num;
            pos = (int) (rnd.nextDouble() * abecedario.length() - 1 + 0);
            cadena = cadena + abecedario.charAt(pos);
            Return = cadena;
            cadena = "";
            m++;
            return Return;
        }
        return cadena;
    }

   
}
