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
class Food < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, against: :name, ignoring: :accents, using: { tsearch: { prefix: true } }

  has_many :ingredients
  has_many :recipes, through: :ingredients
end
