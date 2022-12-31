class CreateProductFeatures < ActiveRecord::Migration[7.0]
  def change
    create_table :product_features do |t|
      t.string :name,         null: false, default: ""
      t.references :product,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
