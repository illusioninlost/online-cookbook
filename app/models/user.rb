class User < ApplicationRecord
  has_many :recipes
  has_many :comments, :through => :recipes
  has_secure_password
  validates_confirmation_of :password
  validates :username, presence: true, length: 3..20, uniqueness: true
  validates :password, length: 3..20, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
