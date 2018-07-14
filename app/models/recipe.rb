require 'pry'

class Recipe < ApplicationRecord
  scope :fast, -> {where("approximate_time < ?", 30)}
  belongs_to :user, optional: true
  belongs_to :caterer
  has_many :comments
  validates :name, presence: true
  validates :creator, presence: true
  validates :notes, presence: true
  validates :special_tools, presence: true
  validates :approximate_time, presence: true, numericality: true, inclusion: { in: 1..999 }
  validates :ingredients, presence: true


  def self.average_ratings(recipe)
    if recipe.comments.empty?
     5
    else
    recipe.comments.average(:ratings).round(2)
    end
  end


end
