class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  def thumbnailify
    object = LinkThumbnailer.generate('https://www.google.fr/search?q=' + self.name.gsub(' ','') + '&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjNhbi9xs3VAhVL2xoKHYYKAboQ_AUICigB&biw=1855&bih=990')
    object.images.first.src.to_s
  end

  def mean_rating
    if self.reviews.nil?
      0
    else
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      (sum.to_f / self.reviews.size).round(2)
    end
  end

  def starify
    "*" * self.mean_rating.to_i
  end

end
