# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do

  # Projects
  Project.delete_all
  wool = Project.create!(title: 'WOOL')
  bhp  = Project.create!(title: 'BHP')
  dws  = Project.create!(title: 'DWS')
  sick = Project.create!(title: 'SICK')

  # Rosters
  Roster.delete_all
  start_date = Date.today.beginning_of_month.beginning_of_week(:sunday)
  end_date   = Date.today.end_of_month.end_of_week(:sunday)
  (start_date..end_date).each do |roster_date|
    unless roster_date.saturday? || roster_date.sunday?
      Roster.create!(roster_date: roster_date, project: wool, billing_probability: 100)
    end
  end

  Roster.create!(roster_date: (start_date + 5.days),  project: sick, billing_probability: 0)
  Roster.create!(roster_date: (start_date + 10.days), project: bhp, billing_probability: 90)
  Roster.create!(roster_date: (start_date + 10.days), project: dws, billing_probability: 50)
  Roster.create!(roster_date: (start_date + 11.days), project: bhp, billing_probability: 90)

end
