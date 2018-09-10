class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :guitar, optional: true
  belongs_to :accessory, optional: true

  validates :cart_id,:presence => true

  def name_with_link
  	"<a>#{quantity}</a>".html_safe
  end

end
