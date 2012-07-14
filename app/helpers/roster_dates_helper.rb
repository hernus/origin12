module RosterDatesHelper

  def wday_check_box_tags_for_specific_week(roster_date, format = '%A, %B %e')
    start_of_week = roster_date.beginning_of_week    # Monday
    end_of_week   = roster_date.end_of_week - 2.days # Friday
    content_tag(:span, class: 'wdays') do
      (start_of_week..end_of_week).inject('') do |html, week_date|
        unless week_date == roster_date
          formatted_date = week_date.strftime('%Y-%m-%d')
          id = "wday_#{formatted_date}"
          html << content_tag(:span, { class: 'wday' }) do
            check_box_tag('wday[]', formatted_date, false, { id: id }) + label_tag(id, week_date.strftime(format))
          end
        end
        html
      end.html_safe
    end
  end

  def wday_check_box_tags(opts = {})
    css_class = opts.delete(:class)
    content_tag(:div, class: [ 'wdays', css_class ]) do
      Date::DAYNAMES.zip(0...Date::DAYNAMES.length).inject('') do |html, day_name_with_idx|
        day_name, idx = day_name_with_idx
        id = "wday_#{idx}"
        html << content_tag(:span, { class: 'wday' }) do
          check_box_tag('duplicate[wday][]', idx, false, { id: id }) + label_tag(id, day_name)
        end
      end.html_safe
    end
  end

  def reveal_roster(roster, idx)
    if roster.customer.present? || idx == 0
      {}
    else
      { style: 'display: none;' }
    end
  end

  def link_to_calendar_date(date, url)
    label = date.day.to_s
    label += " #{date.strftime('%b')}" if date === date.beginning_of_month
    link_to label, url, class: 'roster_date_day_number'
  end

  def calendar_from
    set_session_calendar_date(:from, default: Date.today - 1.week)
  end

  def calendar_until
    set_session_calendar_date(:until, default: calendar_from + 3.weeks)
  end

private

  def set_session_calendar_date(key, opts = {})
    session_key  = "calendar_#{key.to_s}".to_sym
    default_date = opts.delete(:default)
    if params[key]
      session[session_key] = Date.parse(params[key])
    else
      session[session_key] ||= default_date
    end
  rescue
    session[session_key] = default_date
  end

end
