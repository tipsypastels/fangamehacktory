class Game < ApplicationRecord
  include Subjected

  has_many :fakemon
  accepts_nested_attributes_for :fakemon, allow_destroy: true

  def pokedex
    @pokedex ||= Pokedex.new(self['pokedex'], self)
  end

  def self.icon
    :gamepad
  end

  def default_fields
    @default_fields ||= {
      introduction: "Use this space to introduce others to your game!",
      story: "Dazzle others with your plot writing.",
      screenshots: "Drag and drop to upload into the editor.",
      features: "What makes your game unique?",
      pokedex: "{{widget pokedex}}",
    }.with_indifferent_access
  end

  def supported_widgets
    @supported_widgets ||= {
      pokedex: PokedexWidgetComponent,
    }.with_indifferent_access
  end
end