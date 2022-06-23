class Address < ApplicationRecord
  attribute :country, :string, default: "Australia"
  belongs_to :user

  
end
