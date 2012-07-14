class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string    :key
      t.string    :name
      t.integer   :parent_id
      t.boolean   :internal, default: false
      t.timestamps
    end
  end
end
