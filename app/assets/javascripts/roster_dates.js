jQuery(function($) {
	
	var findProjectSelect = function($customerSelect) {
		return $customerSelect.closest('.roster').find('select.project');
	}

	var findRateSubmit = function($projectSelect) {
		return $projectSelect.closest('td').next('td').find("input[type='submit']");
	}

	var toggleProjectSelect = function($customerSelect, show, html) {
		var $projectSelect = findProjectSelect($customerSelect);
		var $rateSubmit = findRateSubmit($projectSelect);

		if (show) {
			$projectSelect.html(html);
			$rateSubmit.show();
		} else {
			$projectSelect.html('');
			$rateSubmit.hide();
		}
	}

	$('.roster_dates .schedule_rate input')
		.on('click', function() {
			var $projectSelect = $(this).closest('td').prev('td').find('select');
			var projectId = $('option:selected', $projectSelect).attr('value');
			
			$('#schedule_rates_project_id').val(projectId);
		});


	$('.roster_dates select.customer')
		.on('ajax:before', function() {     
			var $this      = $(this);
			var customerId = $('option:selected', $this).attr('value');
			var $projectSelect;

			if (customerId !== '') {
				$this.data('params', 'customer_id=' + customerId);
				return true;
			} else {
				toggleProjectSelect($this, false);
				return false;
			}
		})
		
		.on('ajax:success', function(xhr, data, status) {
			var $projectSelect;
			var html = '';

			if ('success' === status) {
				for (var i = 0, len = data.length; i < len; i++) {
					html += "<option value='" + data[i]['id'] + "'>" + data[i]['name'] + "</option>";
				}
				toggleProjectSelect($(this), true, html);
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

});
