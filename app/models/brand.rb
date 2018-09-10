class Brand < ApplicationRecord
	include FieldValidation

	has_many :guitars,:dependent => :destroy
	has_many :accessories,:dependent => :destroy
end
