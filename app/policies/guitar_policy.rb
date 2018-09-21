class GuitarPolicy < ApplicationPolicy
	attr_reader :admin, :guitar

	def initialize(admin, guitar)
		@admin = admin
		@guitar = guitar
	end

	def new?
		admin.email == "1testmail7647@gmail.com" ? true : false
	end

	class Scope < Scope
		def resolve
		  scope
		end
	end
end
