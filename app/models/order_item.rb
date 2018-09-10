class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :guitar,optional: true
  belongs_to :accessory,optional: true

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
      return self.guitar.purchased_at.strftime("%B %d, %Y") unless self.guitar.purchased_at.blank?
    elsif !self.accessory_id.blank?
      return self.accessory.purchased_at.strftime("%B %d, %Y") unless self.accessory.purchased_at.blank?
    else  
      return ""     
    end
  end

end
