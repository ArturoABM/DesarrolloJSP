$(document).ready(function () {
    $('select[name=DtEstadoOrg]').on('change', function () {
        $.ajax({
            type: 'GET',
            url: 'EstadoOP',
            data: 'codigoestado=' + $('select[name=DtEstadoOrg]').val(),
            statusCode: {
                404: function () {
                    alert('Pajina no encontrada');
                }
            },
            success: function (datos) {
                $('select[name=DtMunicipioOrg] option').remove();
                var Pegado = datos.split(":");
                for (var i = 0; i < Pegado.length - 1; i++) {
                    var codigomunicipio = Pegado[i].split("-")[0];
                    var nombremunicipio = Pegado[i].split("-")[1];
                    console.log(nombremunicipio);
                    $('select[name=DtMunicipioOrg]').append('<option value="' + nombremunicipio + '">' + nombremunicipio + '</option>');
                }
            }
        });
    });
});