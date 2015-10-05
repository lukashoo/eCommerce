$(document).ready(function(){
 	moreClicker();
});


function moreClicker() {
	$('.apartment_more').on('click', function(){
		$(this).siblings(".facilities").toggleClass("nodisplay");
	});
};


