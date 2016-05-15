$(function() {
	$("#showConveni").click(function(){
        $('#dadesConveni').toggle();
    });

    $("#dataReunio").datepicker({
        firstDay: 1,
        dayNamesMin: ["D", "L", "M", "X", "J", "V", "S"],
        monthNames: ["Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Setembre", "Octubre", "Novembre", "Decembre"],
        minDate: 0,
        dateFormat: "dd-mm-yy",
        buttonImage: "./img/calendar.gif",
        showOn: "button",
        buttonImageOnly: true,
        buttonText: "Selecciona la data",
        onClose: function( selectedDate ) {
            $( "#to" ).datepicker( "option", "minDate", selectedDate );
        }
    });
});

function loadTime () {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	var hh = today.getHours();
	var minmin = today.getMinutes();

	if(dd<10) dd='0'+dd;
	if(mm<10) mm='0'+mm;
	if(hh<10) hh='0'+hh;
	if(minmin<10) minmin='0'+minmin;

	$('#dataReunio').val(dd+'-'+mm+'-'+yyyy);
	$('#inputHoraReunio').val(hh+':'+minmin);

	$('#inputHoraReunio').prop('readonly', true);
}

function counterChar(val, counter) {
    var len = val.value.length;
    if (len >= 256) val.value = val.value.substring(0, 256);
    else $(counter).html(256 - len);
};