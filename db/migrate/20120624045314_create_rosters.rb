class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters, :force => true do |t|
      t.string    :key
      t.integer   :customer_id
      t.integer   :project_id
      t.integer   :roster_date_id
      t.integer   :shift
      t.float     :hours
      t.integer   :activity_id
      t.text      :description
      t.timestamps
      t.datetime  :deleted_at
    end
    add_index :rosters, :customer_id
    add_index :rosters, :project_id
    add_index :rosters, :roster_date_id
  end
end
