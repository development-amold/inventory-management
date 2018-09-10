class Guitar < ApplicationRecord
	VALIDATE_ATTRS = ["name", "purchased_at"]
	validates_presence_of VALIDATE_ATTRS
	validates :unit_price, :presence => true,:numericality => true,:format => { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }
	
	belongs_to :brand
	belongs_to :category
	has_many :cart_items,:dependent => :destroy

  def usn
  	"GUI-#{self.id}"
  end

	def self.search(q)
	  if q
	    Guitar.joins(:brand).where('lower(guitars.name) LIKE :search OR lower(brands.name) LIKE :search', search: "%#{q.downcase}%")
	  else
	    all
	  end
	end

end
