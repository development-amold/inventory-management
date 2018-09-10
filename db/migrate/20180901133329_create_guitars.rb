class CreateGuitars < ActiveRecord::Migration[5.2]
  def change
    create_table :guitars do |t|
      t.references :brand, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name
      t.decimal :unit_price, precision: 12, scale: 3
      t.integer :stringscount
      t.datetime :purchased_at

      t.timestamps
    end
  end
end
