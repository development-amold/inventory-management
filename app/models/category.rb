class Category < ApplicationRecord
	validates :name, :presence => true
	validates_uniqueness_of :name,:case_sensitive => false,:scope => :parent_id
	scope :parentcat, -> {where(:parent_id => nil)}
	scope :subcat, -> {where.not(:parent_id => nil)}

	has_many :guitars,:dependent => :destroy
	has_many :picks,:dependent => :destroy

	def parent_cat_name
		cat_name = Category.find_by(:id => self.parent_id)
		if !cat_name.blank?
			return cat_name.name
		end
	end
end
