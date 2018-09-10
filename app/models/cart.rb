class Cart < ApplicationRecord
	has_many :cart_items, :dependent => :destroy

	def add_product(prod_type,prod_id)
		conditional_hash = {}
		@msg = ""
		if prod_type == "guitar"
			@guitar = Guitar.select(:id,:unit_price).find_by(:id => prod_id)
			if @guitar
				conditional_hash[:guitar_id] = @guitar.id
				conditional_hash[:unit_price] = @guitar.unit_price
			else
				@msg = "invalid"		
				return @msg
			end
		else
			@acc = Accessory.select(:id,:unit_price).find_by(:id => prod_id)
			if @acc
				conditional_hash[:accessory_id] = @acc.id
				conditional_hash[:unit_price] = @acc.unit_price
			else
				@msg = "invalid"		
				return @msg
			end			
		end
		current_item = cart_items.find_by(conditional_hash)
		if current_item
			current_item.quantity += 1
			current_item.sub_total = current_item.quantity * current_item.unit_price
		else
			conditional_hash[:quantity] = 1
			conditional_hash[:sub_total] = (conditional_hash[:quantity]) * (conditional_hash[:unit_price])
			current_item = cart_items.build(conditional_hash)
		end
		current_item.save
		return "success"
	end

	def total_amount
		cart_items.sum(:sub_total)
	end

end
