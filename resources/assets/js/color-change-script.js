$(document).ready(function() {
	$(".tbtn").click(function() {
		$('.card').toggleClass('active')
	});
});
function swapStyleSheet(sheet){
	document.getElementById('change-color').setAttribute('href', sheet);
};