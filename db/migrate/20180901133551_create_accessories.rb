class CreateAccessories < ActiveRecord::Migration[5.2]
  def change
    create_table :accessories do |t|
      t.references :pick, foreign_key: true
      t.references :strap, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :name
      t.decimal :unit_price, precision: 12, scale: 3

      t.timestamps
    end
  end
end
