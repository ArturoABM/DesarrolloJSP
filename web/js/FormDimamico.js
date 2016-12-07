/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
    function getParameterByName(name) {
        if (name !== "" && name !== null && name != undefined) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                    results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        } else {
            var arr = location.href.split("/");
            return arr[arr.length - 1];
        }

    }
    var valor = getParameterByName('Configuracion');
    var div1, div2, div3, div4, div5, div6, button, spam, h4, texto, p, txt, btn1, btn2, txt1, txt2,divform, divFnl;

    div2 = document.createElement("div");
    div2.setAttribute("class", "modal-dialog");
    div2.setAttribute("role", "document");
    div3 = document.createElement("div");
    div3.setAttribute("class", "modal-content");
    div4 = document.createElement("div");
    div4.setAttribute("class", "modal-header");
    button = document.createElement("button");
    button.type = 'button';
    button.setAttribute("class", "close");
    button.setAttribute("data-dismiss", "modal");
    button.setAttribute("aria-label", "Close");
    spam = document.createElement("span");
    spam.setAttribute("aria-hidden", "true");
    h4 = document.createElement("h4");
    texto = document.createTextNode("Personal Data Settings");
    h4.appendChild(texto);
    button.appendChild(spam);
    div4.appendChild(h4);
    div4.appendChild(button);
    div5 = document.createElement("div");
    div5.setAttribute("class", "modal-body");
    divform = document.getElementById('datform');
    div5.appendChild(divform);
    div6 = document.createElement("div");
    div6.setAttribute("class", "modal-footer");
    btn1 = document.createElement("button");
    btn1.type = 'button';
    btn1.setAttribute("class", "btn btn-default");
    btn1.setAttribute("data-dismiss", "modal");
    txt1 = document.createTextNode("Close");
    btn1.appendChild(txt1);

    btn2 = document.createElement("button");
    btn2.type = 'button';
    btn2.id = 'guardara';
    btn2.setAttribute("class", "btn btn-primary");
    txt2 = document.createTextNode("Save changes");
    btn2.appendChild(txt2);
    div6.appendChild(btn1);
    div6.appendChild(btn2);
    div3.appendChild(div4);    
    div3.appendChild(div5);
    div3.appendChild(div6);
    div2.appendChild(div3);

    divFnl = document.getElementById("myModal").appendChild(div2);

    if (valor.length > 0) {
        $("#myModal").modal();
    }


});


