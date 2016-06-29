$(document).ready(function() {
	/* Binding a click event handler to the links: */
	$('li.page_sidebar_menu_button a').click(function(e) {

		/* Finding the drop down list that corresponds to the current section: */
		$(this).parent().toggleClass("current");
	//	alert($(this).parent()[0].className);
		var dropDown = $(this).parent().next();
		 
		/* Closing all other drop down sections, except the current one */
		$('.dropdown').not(dropDown).slideUp('slow');
		$(this).siblings().removeClass("current").removeClass('current');
		dropDown.slideToggle('slow');

		/* Preventing the default event (which would be to navigate the browser to the link's address) */
		/*e.preventDefault();*/
	})

});