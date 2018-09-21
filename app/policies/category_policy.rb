class CategoryPolicy < ApplicationPolicy
	def new?
		admin.email == "1testmail7647@gmail.com" ? true : false
	end	
  class Scope < Scope
    def resolve
      scope
    end
  end
end
