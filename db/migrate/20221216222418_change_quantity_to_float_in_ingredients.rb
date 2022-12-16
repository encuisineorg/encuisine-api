class ChangeQuantityToFloatInIngredients < ActiveRecord::Migration[7.0]
  def change
    change_column :ingredients, :quantity, :float
  end
end
