class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name,   null: false, default: ""
      t.text :detail
      t.decimal :price, null: false, default: 0
      t.integer :sales, null: false, default: 0

      t.timestamps
    end
  end
end