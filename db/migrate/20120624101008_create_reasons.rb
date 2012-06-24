class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons, :force => true do |t|
      t.string    :key
      t.integer   :company_id
      t.string    :description
      t.string    :color
      t.string    :background_color
      t.timestamps
      t.datetime  :deleted_at
    end
  end
end
