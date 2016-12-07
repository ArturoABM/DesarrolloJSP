/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#guardara').click(function (event) {
        var nombrevar = $('#nombre').val();
        var apellidosvar = $('#apellidos').val();
        var sexovar = $('#sexo').val();
        var emailvar = $('#email').val();
        var Contracenavar = $('#contrasena').val();
        var idvar = $('#id').val();
        // Si en vez de por post lo queremos hacer por get, cambiamos el $.post por $.get
        $.post('PerfilUsuaro', {
            nombre: nombrevar,
            apellidos: apellidosvar,
            sexo: sexovar,
            email: emailvar,
            contrasena: Contracenavar,
            id: idvar,
            action: "evt1"

        }, function (responseText) {
            $('#divtbl').html(responseText);

        });
        document.Formulario.id.value = '';
        document.Formulario.nombre.value = '';
        document.Formulario.apellidos.value = '';
        document.Formulario.sexo.value = '';
        document.Formulario.email.value = '';
        document.Formulario.contrasena.value = '';
        var data = null;
        
    });
});
