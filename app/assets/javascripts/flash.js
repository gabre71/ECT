$(document).ready(function() {
	$("[id^='flash_']").each(function() {
		$(this).delay(5000).fadeOut();
	})
});