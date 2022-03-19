class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients, id: :uuid do |t|
      t.references :recipe, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
