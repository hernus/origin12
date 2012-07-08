class CreateRosterScheduleRates < ActiveRecord::Migration
  def change
    create_table :roster_schedule_rates do |t|
      t.integer :roster_id, null: false
      t.integer :schedule_rate_id, null: false
      t.timestamps
    end
  end
end
