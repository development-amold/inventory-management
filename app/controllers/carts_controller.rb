class CartsController < ApplicationController
	before_action :get_cart, only: [:carts, :create_order,:add_to_cart]
	before_action :get_cart_item, only: [:edit_cartitem, :delete_cart_item, :update_cart_item]

	def carts
		
	end

	def add_to_cart
		@msg = @cart.add_product(params[:type],params[:id].to_i)
		respond_to do |format|
			format.js
		end		
	end

	def edit_cartitem
		respond_to do |format|
			format.js
		end
	end

	def update_cart_item
		if (params[:quantity]).to_i > 0
			if params[:commit] == "Save"
				begin
					sub_total = (params[:quantity]).to_i * @cart_item.unit_price
					@cart_item.update_attributes(:quantity => params[:quantity].to_i,:sub_total => sub_total)
				rescue => ex
					Rails.logger.warn "---Exception--CartItem----#{ex.message}----"
				end
			end
			@msg = "updated"
		else
			@msg = "updated_err"
		end	
		
		render "add_to_cart"
	end

	def delete_cart_item
		if @cart_item
			@msg = "deleted"			
			@cart_item.destroy
		else
			@msg = "invalid"	
		end
		render "add_to_cart"
	end

	def create_order
		@status_msg=""
		if params[:firstname].blank? || params[:lastname].blank? || params[:email].blank?
			@status_msg = "invaliderror"
		else
			@user = User.find_by(:email => params[:email])
			if @user.nil?
				@user = User.create(:firstname => params[:firstname],:lastname => params[:lastname],:email => params[:email])
			end
			if @user
				if current_cart_items_count > 0
					begin
						@order = Order.new(:user_id => @user.id)
						arr = []
						@cart.cart_items.order("id asc").each do |item|
							arr << {guitar_id: item.guitar_id, accessory_id: item.accessory_id, total_price: item.sub_total, quantity: item.quantity}
						end
						@order.order_items.build(arr)
						@order.save
						@cart.destroy
						@status_msg = "success"
					rescue Exception => e
						Rails.logger.warn "----Exception-----#{e.message}-------"
						@status_msg = "invalidkey"
					end
				else
					@status_msg = "invalidkey"
				end	
			else
				@status_msg = "invalidkey"	
			end
		end
	end

	private 

    def get_cart
      @cart = current_cart
    end	

    def get_cart_item
    	@cart_item = CartItem.find_by(:id => params[:id])
    end

end
