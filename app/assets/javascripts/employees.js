jQuery(document).ready(function($) {
  $('#employee_switch').change(function() {
    $(this).closest('form').trigger('submit');
  });

  $('.employees form button.add_assignment')
    .on('click', function() {
      var $this  = $(this);
      var $tbody = $this.closest('table').find('tbody');
      var $tr    = $('tr:last-child', $tbody);
      var idx    = $tbody.find('tr').length;
      var html   = $tr[0].outerHTML.replace(/(employee_rates_attributes)(_|\]\[)\d+/g, "$1$2" + idx );
      var today = new Date();

      $tr.find(".until select:eq(0) option[value='" + today.getDate() + "']").attr('selected', 'selected');
      $tr.find(".until select:eq(1) option[value='" + today.getMonth() + "']").attr('selected', 'selected');
      $tr.find(".until select:eq(2) option[value='" + today.getFullYear() + "']").attr('selected', 'selected');
      $tbody.append(html);
      return false;
    });

});