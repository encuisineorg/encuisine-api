# == Schema Information
#
# Table name: foods
#
#  id                  :uuid             not null, primary key
#  ciqual_code         :integer
#  ciqual_grp_code     :integer
#  ciqual_ssgrp_code   :integer
#  ciqual_ssssgrp_code :integer
#  co2                 :float
#  emoji               :string
#  local               :boolean          default(FALSE)
#  months              :string           default([]), is an Array
#  name                :string
#  pef                 :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require "test_helper"

class FoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
