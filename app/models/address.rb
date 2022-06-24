class Address < ApplicationRecord
  attribute :country, :string, default: "Australia"
  belongs_to :user

  validates :postcode, length: { is:4 }

  
end
