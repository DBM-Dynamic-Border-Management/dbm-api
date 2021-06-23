class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :name, null: false
      t.string :link, null: false
      t.integer :id_channel, null: false
      t.boolean :is_primary, default: false
      t.references :categories, null: false
      t.datetime :created_at
    end
  end
end