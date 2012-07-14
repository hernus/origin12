jQuery(document).ready(function($) {
  $('#employee_switch').change(function() {
    $(this).closest('form').trigger('submit');
  });

  $('.employees form .add_assignment')
    .on('click', function() {
        alert('here');
        return false;
    });

});