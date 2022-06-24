class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

# Runs validation for associated address and additional username field 
  validates_associated :address
  validates :address, presence: true 
  validates_presence_of :username
  validates_uniqueness_of :username  
  validates_length_of :username, :minimum => 5, :maximum => 10  
       
  
end
