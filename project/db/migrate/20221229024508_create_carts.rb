class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user,             null: false, foreign_key: true
      t.references :product_feature,  null: false, foreign_key: true
      t.integer :num,                 null: false, default: 0

      t.timestamps
    end
  end
end
