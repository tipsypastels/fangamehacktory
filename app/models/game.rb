# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ApplicationRecord
  include Subjected

  has_one :pokedex
  accepts_nested_attributes_for :pokedex
  
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

  def supported_widget_names
    supported_widgets.keys
  end
end
