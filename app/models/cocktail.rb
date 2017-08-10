class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true

  def thumbnailify
    object = LinkThumbnailer.generate('https://www.google.fr/search?q=' + self.name.gsub(' ','') + '&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjNhbi9xs3VAhVL2xoKHYYKAboQ_AUICigB&biw=1855&bih=990')
    object.images.first.src.to_s
  end

end
