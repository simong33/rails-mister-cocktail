class Review < ApplicationRecord
  RATINGS = (0..5)
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: RATINGS, allow_nil: false }
  validates :rating, numericality: true
end
