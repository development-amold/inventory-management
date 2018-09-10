class HomeController < ApplicationController
  def dashboard
  end

  def order_history
  	@users = User.joins(orders: :order_items).order("orders.created_at desc").paginate(:page => params[:page],:per_page => 5)
  end

  def track_product
  	@order_items = OrderItem.order("created_at desc").paginate(:page => params[:page],:per_page => 10)
  end
end
