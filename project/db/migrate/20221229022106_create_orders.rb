class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :real_name,    null: false, default: ""
      t.string :address,      null: false, default: ""
      t.string :telephone,    null: false, default: ""
      t.string :post_code,    null: false, default: ""
      t.integer :status,      null: false, default: 0
      t.decimal :price,       null: false, default: 0
      t.references :user,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
