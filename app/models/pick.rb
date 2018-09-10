class Pick < ApplicationRecord
    validates :name, presence: true
    validates_uniqueness_of :name,:case_sensitive => false,:scope => :category_id
  	
  	belongs_to :category
  	has_many :accessories,:dependent => :destroy
end
