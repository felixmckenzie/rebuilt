class Address < ApplicationRecord
  belongs_to :user

attribute :country, :string, default: "Australia"
validates :street_number, :street_name, :suburb, :postcode, :state, presence: {message: "must be given please"}
#street number field accepts numbers,letters hyphens and forward slashes only. 
validates :street_number, length: { in: 1..40 }
validates :street_number, format: { with: /\A[0-9a-zA-Z-\/]+\z/, message: "only allows numbers, letters, hyphens and forward slashes"}
#street name field accepts upper or lowercase letters only. 
validates :street_name, length: { in: 1..40 }
validates :street_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters"}
#suburb field accepts upper or lowercase letters only. 
validates :suburb, length: { in: 1..40 }
validates :suburb, format: { with: /\A[a-zA-Z]+\z/}
#postcode field is 4 characters long and accepts numbers only. 
validates :postcode, length: { is: 4 }
validates :postcode, format: { with: /\A[0-9]+\z/ } 

def address_to_string
  [ street_number, street_name, suburb, postcode, state ].compact.join(" ")
end 
  
end
 