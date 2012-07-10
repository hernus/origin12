class CreateScheduleRates < ActiveRecord::Migration
  def change
    create_table :schedule_rates do |t|
      t.integer :company_id
      t.integer :customer_id
      t.integer :employee_id
      t.integer :project_id
      t.float   :contract_rate
      t.string  :state
      t.date    :until
      t.timestamps
    end
  end
end
