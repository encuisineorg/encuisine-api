# == Schema Information
#
# Table name: recipes
#
#  id                   :uuid             not null, primary key
#  author               :string
#  content              :text
#  cook_time_in_minutes :integer
#  license              :string
#  prep_time_in_minutes :integer
#  recipe_category      :string
#  recipe_yield         :integer
#  source_url           :string
#  title                :string
#  total_minutes        :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class Recipe < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_title, against: :title, ignoring: :accents, using: { tsearch: { prefix: true } }

  has_many :ingredients
  has_many :foods, through: :ingredients

  accepts_nested_attributes_for :ingredients

  validates :title, presence: true
end
