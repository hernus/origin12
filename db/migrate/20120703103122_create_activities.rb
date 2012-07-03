class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string 		:key
      t.integer		:companyid
      t.string		:description
      t.integer		:display_order
      t.boolean   :default
      t.timestamps
      t.date 			:deleted_at
    end
  end
end
