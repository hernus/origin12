module RostersHelper

  def wday_check_box_tags
    Date::DAYNAMES.zip(0...Date::DAYNAMES.length).inject('') do |html, day_name_with_idx|
      day_name, idx = day_name_with_idx
      id = "wday_#{idx}"
      html << content_tag(:span, { class: 'wday' } ) { check_box_tag('wday', idx, false, id: id) + label_tag(id, day_name) }
    end.html_safe
  end

end
