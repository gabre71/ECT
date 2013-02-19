# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery -> 
	$('#planned_work_time_from_date').datepicker({ dateFormat: "yy-mm-dd" })	
	$('#planned_work_time_to_date').datepicker({ dateFormat: "yy-mm-dd" })