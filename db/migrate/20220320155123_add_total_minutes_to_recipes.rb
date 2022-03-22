class AddTotalMinutesToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :total_minutes, :integer
  end
end
