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

require 'test_helper'

class PokedexTest < ActiveSupport::TestCase
  def kanto
    @kanto ||= pokedexes(:kanto)
  end
  
  test "size of kanto pokedex" do
    assert_equal kanto.size, 4
  end
  
  test "size of kanto pokedex excluding forms" do
    p kanto.pokemon_presences.collect &:form
    assert_equal kanto.size_excluding_forms, 3
  end
end
