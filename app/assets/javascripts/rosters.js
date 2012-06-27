// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery(function($) {

	$('.rosters select#roster_customer_id').on('ajax:before', function() {
		var $this = $(this),
			customerId = $('option:selected', $this).attr('value');
		$this.data('url', '/customers/' + customerId + '/projects');
		return true;
	});

});