

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

    var eliminar = getParameterByName('eliminar');
    $.ajax({
        type: 'POST',
        data: {eliminar: eliminar},
        url: 'DeleteUsuario',
        success: function (result) {
            $('#divtbl').html(result);
        }
    });

});