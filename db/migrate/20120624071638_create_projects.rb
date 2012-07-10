class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects, :force => true do |t|
      t.string    :key
      t.integer   :company_id
      t.integer   :customer_id
      t.integer   :parent_id
      t.integer   :manager_id
      t.string    :short_name
      t.string    :name
      t.string    :description
      t.string    :state
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
