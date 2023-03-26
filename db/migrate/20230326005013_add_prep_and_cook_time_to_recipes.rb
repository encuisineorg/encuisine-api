class AddPrepAndCookTimeToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :prep_time_in_minutes, :integer
    add_column :recipes, :cook_time_in_minutes, :integer
  end
end
