module RosterDatesHelper

  def wday_check_box_tags(roster_date)
    start_of_week = roster_date.beginning_of_week    # Monday
    end_of_week   = roster_date.end_of_week - 2.days # Friday
    (start_of_week..end_of_week).inject('') do |html, week_date|
      unless week_date == roster_date
        id = "wday_#{week_date.strftime('%Y-%m-%d')}"
        html << content_tag(:span, { class: 'wday' }) do
          check_box_tag('wday', id, false, { id: id }) + week_date.strftime('%A, %B %e') # label_tag(id, week_date.to_s(:long))
        end
      end
      html
    end.html_safe
  end

  def reveal_roster(roster, idx)
    if roster.customer.present? || idx == 0
      {}
    else
      { style: 'display: none;' }
    end
  end

end
