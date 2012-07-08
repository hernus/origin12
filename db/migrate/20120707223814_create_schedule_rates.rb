class CreateScheduleRates < ActiveRecord::Migration
  def change
    create_table :schedule_rates do |t|
      t.integer :customer_id
      t.integer :company_id
      t.integer :project_id
      t.string  :state
      t.float   :contract_rate
      t.date    :until
      t.timestamps
    end
  end
end
