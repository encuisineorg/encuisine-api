# == Schema Information
#
# Table name: recipes
#
#  id            :uuid             not null, primary key
#  author        :string
#  content       :text
#  license       :string
#  source_url    :string
#  title         :string
#  total_minutes :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
