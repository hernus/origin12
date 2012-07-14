jQuery(document).ready(function($) {
  $('#company_switch').change(function() {
    $(this).closest('form').trigger('submit');
  });
});