$(function() {
    $( "#from" ).datepicker({
        firstDay: 1,
        dayNamesMin: ["D", "L", "M", "X", "J", "V", "S"],
        monthNames: ["Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Septembre", "Octubre", "Novembre", "Desembre"],
        minDate: 0,
        dateFormat: "dd-mm-yy",
        buttonImage: "./img/calendar.gif",
        showOn: "button",
        buttonImageOnly: true,
        buttonText: "Selecciona la data",
        onClose: function( selectedDate ) {
            $("#to").datepicker("option", "minDate", selectedDate);
        }
    });

    $( "#to" ).datepicker({
        firstDay: 1,
        dayNamesMin: ["D", "L", "M", "X", "J", "V", "S"],
        monthNames: ["Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Septembre", "Octubre", "Novembre", "Desembre"],
        minDate: 0,
        dateFormat: "dd-mm-yy",
        changeMonth: true,
        showOn: "button",
        buttonImage: "./img/calendar.gif",
        buttonImageOnly: true,
        buttonText: "Selecciona la data",
        onClose: function( selectedDate ) {
            $("#from").datepicker("option", "maxDate", selectedDate);
        }
    });

    var empresas = [
      "Apple",
      "LTIM",
      "Logitravel",
      "Movistar",
      "MS2",
      "UIB",
    ];

    $("#inputNomEmpresa").autocomplete({
        select: function(event, ui) {
            $('#inputOcupacio').focus();
            $(this).attr('readonly', true);
            $(this).val(ui.item.value);
            $('#personaContacte').hide();
        },
        source: empresas,
    });
});

function counterChar(val, counter) {
        var len = val.value.length;
        if (len >= 256) val.value = val.value.substring(0, 256);
        else $(counter).html(256 - len);
    };