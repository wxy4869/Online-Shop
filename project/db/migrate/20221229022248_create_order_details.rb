class CreateOrderDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :order_details do |t|
      t.integer :product_feature_id,    null: false, default: 0
      t.integer :num,                   null: false, default: 0
      t.references :order,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
