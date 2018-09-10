class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :cart, foreign_key: true
      t.references :guitar, foreign_key: true
      t.references :accessory, foreign_key: true
      t.integer :quantity
      t.decimal :unit_price, precision: 12, scale: 3
      t.decimal :sub_total, precision: 12, scale: 3

      t.timestamps
    end
  end
end
