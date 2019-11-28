# == Schema Information
#
# Table name: pokemon_forms
#
#  id         :bigint           not null, primary key
#  name       :string
#  type1      :string
#  type2      :string
#  vanilla    :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PokemonFormTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
