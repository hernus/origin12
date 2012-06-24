class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects, :force => true do |t|
      t.string    :key
      t.integer   :customer_id
      t.string    :title
      t.string    :description
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
