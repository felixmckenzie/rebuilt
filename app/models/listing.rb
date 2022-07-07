# frozen_string_literal: true

class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_rich_text :description
  has_one_attached :picture
  has_one :order, dependent: :destroy
  has_many :watches, inverse_of: 'watched_listing', dependent: :delete_all
  has_many :watchers, through: :watches

  # validations for listing form fields
  validates :title, :condition, :price, :description, presence: true
  validates :price, numericality: { only_integer: true }

  enum condition: {
    needs_work: 0,
    fair: 1,
    brand_new: 2
  }
end
