module FieldValidation
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    validates :name, presence: true
    validates_uniqueness_of :name,:case_sensitive => false
  end
end