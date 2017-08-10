class RenameIngredientIdToIngredientsId < ActiveRecord::Migration[5.0]
  def change
    rename_column :doses, :ingredient_id, :ingredients_id
  end
end
