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
			$(this)
				.hide()
				.closest('.roster')
				.nextAll('.roster:first')
				.show();
			return false;
		});

	$('.roster_dates')
		.on('click', 'button.add_schedule', function() {
			var $this  = $(this);
			var $tr    = $this.closest('tr');
			var $tbody = $tr.closest('tbody');
			var idx    = $tbody.find('tr').length;
			var html   = $tr[0].outerHTML.replace(/(schedule_rates_attributes)(_|\]\[)\d+/g, "$1$2" + idx );
			$tbody.append(html);
			$this
				.hide()
				.prevAll('.until_date')
				.show()
				.prevAll('.until_end_of_project')
				.hide();
		});

});
