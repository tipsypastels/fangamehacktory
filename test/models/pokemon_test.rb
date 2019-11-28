# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  slug       :string
#  species    :string
#  vanilla    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pokemons_on_slug  (slug) UNIQUE
#

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
