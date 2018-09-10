class Strap < ApplicationRecord
	include FieldValidation
	has_many :accessories,:dependent => :destroy
end
