class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :listings        
  has_one  :address, dependent: :destroy
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :bought_orders,  foreign_key: "buyer_id", class_name: "Order"
  has_many :watches
  has_many :watched_listings, through: :watches
  accepts_nested_attributes_for :address

# Validations for additional username field and associated address model 
  validates_associated :address
  validates :address, presence: true 
  validates_presence_of :username
  validates_uniqueness_of :username  
  validates_length_of :username, :minimum => 5, :maximum => 10  
       
  
end
