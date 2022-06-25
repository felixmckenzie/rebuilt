class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture

  enum condition: {
    needs_work: 0,
    fair: 1,
    brand_new: 2
  }
end
