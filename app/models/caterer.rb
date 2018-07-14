class Caterer < ApplicationRecord
    has_many :users, :through => :recipes
    has_many :recipes
    has_secure_password
    validates_confirmation_of :password
    validates :username, presence: true, length: 3..20, uniqueness: true
    validates :password, length: 3..20, presence: true, confirmation: true
    validates :password_confirmation, presence: true
end
