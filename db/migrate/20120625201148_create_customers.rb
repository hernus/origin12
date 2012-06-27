class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string    :key
      t.string    :name
      t.integer   :company_id
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
