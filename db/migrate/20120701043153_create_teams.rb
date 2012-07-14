class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams, force: true do |t|
      t.string    :key
      t.integer   :company_id
      t.integer   :parent_id
      t.integer   :manager_id
      t.string    :description
      t.string    :state
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
