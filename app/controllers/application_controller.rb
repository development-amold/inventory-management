class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery prepend: true
	before_action :authenticate_admin!
	helper_method :current_cart,:current_cart_items_count
	


	def current_cart
		@cart = get_set_cart
	end

	def current_cart_items_count
		current_cart.blank? ? 0 : CartItem.where(:cart_id => current_cart.id).count 
	end

	def pundit_user
	  current_admin
	end	

	# def index1
	# 	puts "-----APPLICATIONS---"
	# 	# render :json => {"applications" => "index1"}
	# end	

	rescue_from Pundit::NotAuthorizedError, with: :admin_not_authorized


 private
	def get_set_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end

  def admin_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || categories_path)
  end	

end
