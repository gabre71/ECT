# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> 
	$('#planned_holiday_term_start').datepicker({ dateFormat: "yy-mm-dd" })	
	$('#planned_holiday_term_end').datepicker({ dateFormat: "yy-mm-dd" })	