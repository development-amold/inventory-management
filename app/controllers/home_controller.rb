class HomeController < ApplicationController

  def order_history
  	require "will_paginate/array"
  	@users = User.joins(orders: :order_items).order("orders.created_at desc").uniq.paginate(:page => params[:page],:per_page => 5)
  end

  def track_product
  	@order_items = OrderItem.order("created_at desc").paginate(:page => params[:page],:per_page => 10)
  end

  def index1
  	render :json => {"home" => "index1"}
  end
end
