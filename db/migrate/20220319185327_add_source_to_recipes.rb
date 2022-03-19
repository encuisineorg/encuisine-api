class AddSourceToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :author, :string
    add_column :recipes, :license, :string
    add_column :recipes, :source_url, :string
  end
end
