module RosterDatesHelper

  def wday_check_box_tags(roster_date, format = '%A, %B %e')
    start_of_week = roster_date.beginning_of_week    # Monday
    end_of_week   = roster_date.end_of_week - 2.days # Friday
    content_tag(:span, class: 'wdays') do
      (start_of_week..end_of_week).inject('') do |html, week_date|
        unless week_date == roster_date
          formatted_date = week_date.strftime('%Y-%m-%d')
          id = "wday_#{formatted_date}"
          html << content_tag(:span, { class: 'wday' }) do
            check_box_tag('wday', formatted_date, false, { id: id }) + label_tag(id, week_date.strftime(format))
          end
        end
        html
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

end
