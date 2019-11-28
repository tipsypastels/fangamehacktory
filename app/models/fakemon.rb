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
