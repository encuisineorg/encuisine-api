# == Schema Information
#
# Table name: recipes
#
#  id         :uuid             not null, primary key
#  author     :string
#  content    :text
#  license    :string
#  source_url :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_title, against: :title, ignoring: :accents, using: { tsearch: { prefix: true } }

  has_many :ingredients
  has_many :foods, through: :ingredients

  accepts_nested_attributes_for :ingredients
end
