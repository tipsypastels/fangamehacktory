class PokedexWidgetComponent < Components::Component
  attribute :subject
  delegate :subjected, to: :subject
  delegate :pokedex, to: :subjected
  delegate :empty?, to: :pokedex
end
