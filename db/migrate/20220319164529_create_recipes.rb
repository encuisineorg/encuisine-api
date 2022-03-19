class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
