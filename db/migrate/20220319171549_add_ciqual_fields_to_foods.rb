class AddCiqualFieldsToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :ciqual_code, :integer
    add_column :foods, :ciqual_grp_code, :integer
    add_column :foods, :ciqual_ssgrp_code, :integer
    add_column :foods, :ciqual_ssssgrp_code, :integer
  end
end
