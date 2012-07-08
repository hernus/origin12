class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string 		:key
      t.integer		:company_id
      t.string		:description
      t.integer		:display_order
      t.string    :color
      t.boolean   :default
      t.timestamps
      t.date 			:deleted_at
    end
  end
end
