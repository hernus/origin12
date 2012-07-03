jQuery(function($) {
	
	var $projectSelect = function($customerSelect) {
		// return $customerSelect.closest('div.customer').next('div.project').find('select');
		return $customerSelect.closest('.roster').find('select.project');
	}

	$('.roster_dates select.customer')
		.on('ajax:before', function() {     
			var $this      = $(this);
			var customerId = $('option:selected', $this).attr('value');
			if (customerId !== '') {
				$this.data('params', 'customer_id=' + customerId);
				return true;
			} else {
				$projectSelect($this).html('');
				return false;
			}
		})
		
		.on('ajax:success', function(xhr, data, status) {
			var html  = '';
			if ('success' === status) {
				for (var i = 0, len = data.length; i < len; i++) {
					html += "<option value='" + data[i]['id'] + "'>" + data[i]['name'] + "</option>";
				}
				$projectSelect($(this)).html(html);
			}
		});

	$('.roster_dates button.add_shift')
		.on('click', function() {
			$(this).closest('.roster').nextAll('.roster:first').show();
			return false;
		});

});
