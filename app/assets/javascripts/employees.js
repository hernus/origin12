jQuery(document).ready(function($) {
  $('#employee_switch').change(function() {
    $(this).closest('form').trigger('submit');
  });
});