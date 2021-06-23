class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :link, null: false
      t.string :category
      t.integer :id_channel, null: false
      t.boolean :is_primary, default: false
      t.datetime :created_at
    end
  end
end