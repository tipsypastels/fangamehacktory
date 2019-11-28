# == Schema Information
#
# Table name: fakemons
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  type1      :string
#  type2      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#
# Indexes
#
#  index_fakemons_on_slug  (slug) UNIQUE
#

class Fakemon < ApplicationRecord
  include Pokemon::Helpers

  extend FriendlyId 
  friendly_id :name, use: :slugged
  belongs_to :game

  validates :name, :type1, presence: true

  has_one_attached :image
  has_rich_text :dex_entry

  def inspect
    "#{name} (Fakemon)"
  end

  def pokedex_id
    -id # fakemon are represented by negative numbers in the dex
  end
end
