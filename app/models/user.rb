class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :username, presence: true, length: 3..20
  valdates :password, length: 3..20, presence: true
  has_many :recipes
  has_many :comments, :through => :recipes
end
