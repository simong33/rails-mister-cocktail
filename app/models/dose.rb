class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
   validates_uniqueness_of :cocktail_id, scope: [:cocktail_id, :ingredient_id]
end
