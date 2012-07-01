class CreateRosterDates < ActiveRecord::Migration
  def change
    create_table :roster_dates do |t|
      t.integer :employee_id
      t.date :date

      t.timestamps
    end
  end
end
