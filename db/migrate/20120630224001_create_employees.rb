class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string    :key
      t.integer   :user_id
      t.integer   :company_id  
      t.integer   :employment_type_id
      t.integer   :role_id
      t.string    :first_name
      t.string    :last_name
      t.string    :state
      t.integer   :billing_capacity
      t.date      :started_at
      t.date      :terminated_at
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
