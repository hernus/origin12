class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters, :force => true do |t|
      t.string    :key
      t.integer   :customer_id
      t.integer   :project_id
      t.date      :roster_date
      t.integer   :billing_probability
      t.integer   :reason_id
      t.timestamps
      t.datetime  :deleted_at
    end
    add_index :rosters, :project_id
    add_index :rosters, :roster_date
  end
end
