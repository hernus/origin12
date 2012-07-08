class CreateEmployeeRates < ActiveRecord::Migration
  def change
    create_table :employee_rates do |t|
      t.integer   :employee_id
      t.integer   :company_id
      t.integer   :team_id
      t.float     :cost_rate
      t.float     :card_rate
      t.float     :internal_rate
      t.date      :until
      t.timestamps
    end
  end
end
