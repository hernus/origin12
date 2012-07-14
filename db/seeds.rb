# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  Company.create!(key: 'O12', name: 'Origin12', internal: false)

  Activity.create!([
    { description: '100% Probability', display_order: 10 },
    { description: '90% Probability',  display_order: 20 },
    { description: '50% Probability',  display_order: 30 },
    { description: '10% Probability',  display_order: 40 },
    { description: 'Planned Bench',    display_order: 50 },
    { description: 'Unplanned Bench',  display_order: 60, default: true },
    { description: 'Non-Working Day',  display_order: 70 },
    { description: 'Sick Leave',       display_order: 80 },
    { description: 'Time Off in Lieu', display_order: 90 },
    { description: 'Annual Leave',     display_order: 100 }
  ])
end
