# == Schema Information
#
# Table name: foods
#
#  id                  :bigint           not null, primary key
#  name                :string
#  emoji               :string
#  months              :string           default([]), is an Array
#  local               :boolean          default(FALSE)
#  pef                 :float
#  co2                 :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  ciqual_code         :integer
#  ciqual_grp_code     :integer
#  ciqual_ssgrp_code   :integer
#  ciqual_ssssgrp_code :integer
#
class Food < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, against: :name, ignoring: :accents, using: { tsearch: { prefix: true } }
end
