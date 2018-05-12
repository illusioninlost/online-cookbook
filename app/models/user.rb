class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  has_many :recipes
  has_many :comments, :through => :recipes
end
