class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :guitar, foreign_key: true
      t.references :accessory, foreign_key: true
      t.decimal :total_price, precision: 15, scale: 3
      t.integer :quantity

      t.timestamps
    end
  end
end
