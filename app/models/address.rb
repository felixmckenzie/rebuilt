# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  attribute :country, :string, default: 'Australia'
  validates :street_number, :street_name, :suburb, :postcode, :state, presence: true
  # #street name field accepts upper or lowercase letters only.
  validates :street_name, length: { in: 1..40 }
  validates :street_name, format: { with: /\A[a-zA-Z]+\z/ }
  # #suburb field accepts upper or lowercase letters only.
  validates :suburb, length: { in: 1..40 }
  validates :suburb, format: { with: /\A[a-zA-Z]+\z/ }
  # postcode field is 4 characters long and accepts numbers only.
  validates :postcode, length: { is: 4 }
  validates :postcode, format: { with: /\A[0-9]+\z/ }

  enum state: {
    NSW: 0,
    QLD: 1,
    VIC: 3,
    TAS: 4,
    SA: 5,
    WA: 6,
    ACT: 7,
    NT: 8
  }

  def address_to_string
    [street_number, street_name, suburb, postcode, state].compact.join(' ')
  end
end
