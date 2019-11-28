# == Schema Information
#
# Table name: pokemon_forms
#
#  id                 :bigint           not null, primary key
#  name               :string
#  smogon_sprite_slug :string
#  type1              :string
#  type2              :string
#  vanilla            :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  pokemon_id         :integer
#

class Pokemon::Form < ApplicationRecord
  belongs_to :pokemon

  has_many :presences_in_pokedexes, class_name: 'Pokemon::Presence'
  has_many :pokedexes, through: :presences_in_pokedexes
  has_rich_text :dex_entry

  validates :name, :type1, presence: true
  validates :smogon_sprite_slug, presence: true, if: :vanilla?
  validates :smogon_sprite_slug, absence: true, if: :custom?
  validate :cannot_have_vanilla_form_on_custom_pokemon

  delegate :species_name, to: :pokemon

  def custom?
    not vanilla?
  end

  def sprite
    if custom?
      raise "Custom Pokemon do not have form-level sprites. Each presence must define its own sprite"
    end

    "http://play.pokemonshowdown.com/sprites/gen5/#{smogon_sprite_slug}.png"
  end

  private

  def cannot_have_vanilla_form_on_custom_pokemon
    if vanilla? && pokemon.custom?
      raise "A custom Pokemon cannot have a vanilla form"
    end
  end
end
