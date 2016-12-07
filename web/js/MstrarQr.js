/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    window.onload($(document).ready(function (){
      $.post('HistorialQR', {
            action: "evt1"

        }, function (responseText) {
            $('#DIVQR').html(responseText);

        });
       }));
      


