class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  validates :name, presence: true
  validates :creator, presence: true
  validates :notes, presence: true
  validates :special_tools, presence: true
  validates :approximate_time, presence: true, numericality: true, inclusion: { in: 1..999 }
  validates :ingredients, presence: true


  def self.average_ratings
    @recipe=Recipe.find_by(id: params[:id])
    binding.pry
  end


end
