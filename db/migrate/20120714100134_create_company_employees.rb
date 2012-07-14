class CreateCompanyEmployees < ActiveRecord::Migration
  def change
    create_table :company_employees, force: true do |t|
      t.integer :company_id
      t.integer :employee_id
      t.timestamps
    end
    add_index :company_employees, [ :company_id, :employee_id ]
    add_index :company_employees, :employee_id
  end
end
