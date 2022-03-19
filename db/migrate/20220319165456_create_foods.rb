class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :emoji
      t.string :months, array: true, default: []
      t.boolean :local, default: false
      t.float :pef
      t.float :co2

      t.timestamps
    end
  end
end
