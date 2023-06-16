# == Schema Information
#
# Table name: ingredients
#
#  id         :uuid             not null, primary key
#  name       :string
#  quantity   :float
#  unit       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food_id    :uuid             not null
#  recipe_id  :uuid             not null
#
# Indexes
#
#  index_ingredients_on_food_id    (food_id)
#  index_ingredients_on_recipe_id  (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (food_id => foods.id)
#  fk_rails_...  (recipe_id => recipes.id)
#
require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
