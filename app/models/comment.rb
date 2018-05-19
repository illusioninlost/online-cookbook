class Comment < ApplicationRecord
  belongs_to :recipe
  validates :name, presence: true
  validates :content, presence: true
  validates :ratings, presence: true, numericality: true, inclusion: { in: 0..5 }
end
