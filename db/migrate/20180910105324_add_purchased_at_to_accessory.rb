class AddPurchasedAtToAccessory < ActiveRecord::Migration[5.2]
  def change
    add_column :accessories, :purchased_at, :datetime
  end
end
