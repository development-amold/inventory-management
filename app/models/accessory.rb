class Accessory < ApplicationRecord
	VALIDATE_ATTRS = ["name"]
	validates_presence_of VALIDATE_ATTRS

	validates :unit_price, :presence => true,:numericality => true,:format => { :with => /\A\d{1,6}(\.\d{0,2})?\z/ }
	validate :check_pick_strap

	def check_pick_strap
		if (self.strap_id.blank? && self.pick_id.blank?) || (!self.strap_id.blank? && !self.pick_id.blank?)
			errors.add(:base,"Please select only one type: Pick or Strap")
			return false
		end
	end

	belongs_to :pick,optional: true
	belongs_to :strap, optional: true
	belongs_to :brand
	has_many :cart_items,:dependent => :destroy
  
end
