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
  belongs_to :game, optional: true
  has_many :pokemon_presences, class_name: 'Pokemon::Presence'
  accepts_nested_attributes_for :pokemon_presences, allow_destroy: true
  
  validates :name, presence: true
  validates :game, presence: true, unless: :template?
  validates :game, absence: true, if: :template?

  delegate :empty?, to: :pokemon_presences
  
  # there might be a better way to do this but i was getting issues
  # with nested associations causing weird duplication... :|
  def pokemon_forms
    Rails.cache.fetch("#{cache_key_with_version}/pokemon_forms") do
      Pokemon::Form.where id: pokemon_presences.ids
    end
  end

  def clone_to(game)
    raise NotImplementedError
  end

  def size
    pokemon_presences.size
  end

  def size_excluding_forms
    pokemon_forms.pluck(:pokemon_id).uniq.size
  end
end
