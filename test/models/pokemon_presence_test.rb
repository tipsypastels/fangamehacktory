# == Schema Information
#
# Table name: pokemon_presences
#
#  id         :bigint           not null, primary key
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  form_id    :integer
#  game_id    :integer
#

require 'test_helper'

class PokemonPresenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
