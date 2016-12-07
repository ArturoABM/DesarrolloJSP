
var Ajax;
$(document).ready(Ajax = function () {

    $('#guardar').click(function () {
        var email = $('#Email').val();
        var contracena = $('#Contrasena').val();
        $.ajax({
            type: 'POST',
            data: {Email: email, Contrasena: contracena, action: "evento1"},
            url: 'LogeoUsuario',
            success: function (result) {

                $('#validacionFormulario').html(result);
            }
        });
        $.ajax({
            type: 'POST',
            data: {Email: email, Contrasena: contracena, action: "evento2"},
            url: 'LogeoUsuario',
            success: function (result) {

                $('#ValidarEmail').html(result);
            }
        });
        $.ajax({
            type: 'POST',
            data: {Email: email, Contrasena: contracena, action: "evento3"},
            url: 'LogeoUsuario',
            success: function (result) {

                $('#validacionPassword').html(result);
            }
        });
    });

});
