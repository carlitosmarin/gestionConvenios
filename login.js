$(function() {
	$('#user-alumne').click(function () {

		$('#user-password, #alumne-clau').toggle();
		$('#user-alumne span').toggleClass('glyphicon-arrow-right glyphicon-user');
		$('#info-alumne input[type="submit"]').attr('value', ($('#alumne-clau').hasClass('selected') ? 'Entrar' : 'Veure'));

		setTimeout(function () {
			$('#user-password').toggleClass('no-selected');
			$('#alumne-clau').toggleClass('selected');
		}, 50);
	})
});