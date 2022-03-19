# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  recipe_id  :bigint           not null
#  name       :string
#  quantity   :integer
#  unit       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food_id    :bigint           not null
#
class Ingredient < ApplicationRecord
  belongs_to :recipe
end
