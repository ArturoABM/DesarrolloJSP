$(document).ready(function () {
    $('select[name=DtoEstadoDsn]').on('change', function () {
        $.ajax({
            type: 'GET',
            url: 'EstadoDT',
            data: 'codigoestadodestino=' + $('select[name=DtoEstadoDsn]').val(),
            statusCode: {
                404: function () {
                    alert('Pajina no encontrada');
                }
            },
            success: function (data) {
                $('select[name=DtoMunicipioDsn] option').remove();
                var Peg = data.split(":");
                for (var i = 0; i < Peg.length - 1; i++) {
                    var codigomunicipiodestino = Peg[i].split("-")[0];
                    var nombremunicipiodestino = Peg[i].split("-")[1];
                   
                    $('select[name=DtoMunicipioDsn]').append('<option value="' + nombremunicipiodestino + '">' + nombremunicipiodestino + '</option>');
                }
            }
        });
    });
});