class PokedexWidgetComponent < Components::Component
  attribute :subject
  delegate :subjected, to: :subject
  delegate :pokedex, to: :subjected
  delegate :present?, to: :pokedex
end
