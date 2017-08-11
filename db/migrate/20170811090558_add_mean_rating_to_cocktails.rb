class AddMeanRatingToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_column :cocktails, :mean_rating, :float
  end
end
