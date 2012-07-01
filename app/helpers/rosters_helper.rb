module RostersHelper

  def wday_check_box_tags(date)
    Date::DAYNAMES.zip(0...Date::DAYNAMES.length).inject('') do |html, day_name_with_idx|
      day_name, idx = day_name_with_idx
      id = "wday_#{idx}"
      html << content_tag(:span, { class: 'wday' } ) do
        checked = date.wday == idx
        check_box_tag('wday', idx, checked, { id: id, disabled: checked }) + label_tag(id, day_name)
      end
    end.html_safe
  end

  def roster_customer_select
    collection_select \
        :roster,
        :customer_id, Customer.all,
        :id, :display_name,
        { prompt: true },
        { data: { remote: true }}
  end

  def roster_project_select
    collection_select \
        :roster,
        :project_id, [],
        :id, :display_name
  end
end
