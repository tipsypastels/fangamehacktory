# == Schema Information
#
# Table name: pokedexes
#
#  id         :bigint           not null, primary key
#  name       :string
#  template   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  game_id    :integer
#

class Pokedex < ApplicationRecord
  scope :templates, -> {
    where(template: true)
  }

  belongs_to :game, optional: true

  has_many :pokemon_presences, 
    class_name: 'Pokemon::Presence',
    dependent: :destroy
  
  has_many :pokemon_forms, -> { distinct }, 
    through: :pokemon_presences,
    class_name: 'Pokemon::Form', source: :form

  has_many :pokemon, -> { distinct }, 
    through: :pokemon_forms

  validates :name, presence: true
  validates :game, presence: true, unless: :template?
  validates :game, absence: true, if: :template?

  delegate :present?, to: :pokemon_presences

  def clone_to(game)
    raise NotImplementedError
  end

  def size
    pokemon_presences.size
  end

  def size_excluding_forms
    pokemon.size
  end

  def search(param)
    case param
    when String
      search_from_name(param)
    when Pokemon
      search_from_pokemon(param)
    when Pokemon::Form
      search_from_form(param)
    when Pokemon::Presence
      search_from_presence(param)
    else
      raise "#{pokemonlike} is not a valid argument for Pokedex#search"
    end.presence
  end
  
  alias include? search

  private

  def search_from_name(name)
    forms = pokemon_forms.where("name ILIKE ?", "%#{name}%")
    search_from_form(forms)
  end

  def search_from_pokemon(pokemon)
    forms = pokemon_forms.find_by(pokemon: pokemon)
    search_from_form(forms)
  end

  def search_from_form(form)
    pokemon_presences.where(form: form)
  end

  def search_from_presence(presence)
    [presence] if presence.pokedex == self
  end
end
