class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture
  has_one :order, dependent: :destroy 

  # validations for listing form fields 
  validates :title, :condition, :price, :description, presence: true

  enum condition: {
    needs_work: 0,
    fair: 1,
    brand_new: 2
  }
  
end
