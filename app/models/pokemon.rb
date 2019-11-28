# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  slug       :string
#  species    :string
#  vanilla    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pokemons_on_slug  (slug) UNIQUE
#

class Pokemon < ApplicationRecord
  extend FriendlyId
  friendly_id :species, use: :slugged

  has_many :forms, class_name: 'Pokemon::Form'

  validates :species, presence: true

  def custom?
    not vanilla?
  end
end
