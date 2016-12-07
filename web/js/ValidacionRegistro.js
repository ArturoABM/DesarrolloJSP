var Ajax;
            $(document).ready(Ajax = function () {

                $('#btnguardar').click(function () {
                    var sexo = $('#Sexo').val(); 
                    var nombre = $('#Nombre').val();
                    var apellidos = $('#Apellidos').val();
                    var email = $('#Email').val();
                    var contracena = $('#Contrasena').val();                    
                    var privacidad = $('#Privacidad').val();

                    $.ajax({
                        type: 'POST',
                        data: {Sexo: sexo, Nombre: nombre, Apellidos: apellidos, Email: email, Contrasena: contracena, Privacidad: privacidad, action: "evento1"},
                        url: 'PaginaPrincipal',
                        success: function (result) {
                            $('#ValidarFormularios').html(result);
                        }
                    });



                    $.ajax({
                        type: 'POST',
                        data: {Nombre: nombre, action: "evento2"},
                        url: 'PaginaPrincipal',
                        success: function (result) {

                            $('#ValidarNombre').html(result);
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        data: {Apellidos: apellidos, action: "evento3"},
                        url: 'PaginaPrincipal',
                        success: function (result) {

                            $('#ValidarApellidos').html(result);
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        data: {Email: email, action: "evento4"},
                        url: 'PaginaPrincipal',
                        success: function (result) {

                            $('#ValidarEmail').html(result);
                        }
                    });
                    $.ajax({
                        type: 'POST',
                        data: {Contrasena: contracena, action: "evento5"},
                        url: 'PaginaPrincipal',
                        success: function (result) {
                            $('#ValidarPassword').html(result);
                        }
                    });


                });

            });