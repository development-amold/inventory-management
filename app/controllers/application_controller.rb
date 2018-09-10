class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :authenticate_admin!
	helper_method :current_cart,:current_cart_items_count
	

	def current_cart
		@cart = get_set_cart
	end

	def current_cart_items_count
		current_cart.blank? ? 0 : CartItem.where(:cart_id => current_cart.id).count 
	end

 private
	def get_set_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

end
