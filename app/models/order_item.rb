class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :guitar,optional: true
  belongs_to :accessory,optional: true

  after_destroy :del_associated_orders

  def prod_name
  	if !self.guitar_id.blank?
  		return self.guitar.name
  	elsif !self.accessory_id.blank?
  		return self.accessory.name
  	else	
  		return ""			
  	end
  end

  def purchased_at
    if !self.guitar_id.blank?
      return self.guitar.purchased_at.strftime("%B %d, %Y") unless self.guita.purchased_at.blank?
    elsif !self.accessory_id.blank?
      return self.accessory.purchased_at.strftime("%B %d, %Y") unless self.accessory.purchased_at.blank?
    else  
      return ""     
    end
  end

  def del_associated_orders
    @order = Order.find_by(:id => self.order_id)
    if @order
      unless @order.order_items.count > 0
        @order.delete
      end
    end
  end

end
