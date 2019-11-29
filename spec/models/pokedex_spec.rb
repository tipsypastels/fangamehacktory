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

require 'rails_helper'

RSpec.describe Pokedex, type: :model do
  before :all do
    Pokedex.destroy_all
    Pokemon.destroy_all
  end

  context 'simple bulbasaur kanto dex' do
    before :all do
      @kanto = create(:pokedex, name: 'Kanto', template: true)

      @bulbasaur = create(:pokemon, species: 'Bulbasaur')
      @ivysaur = create(:pokemon, species: 'Ivysaur')
      @venusaur = create(:pokemon, species: 'Venusaur')

      @form_bulbasaur = create(:pokemon_form_grass_poison, 
        pokemon: @bulbasaur)

      @form_ivysaur = create(:pokemon_form_grass_poison,
        pokemon: @ivysaur)

      @form_venusaur = create(:pokemon_form_grass_poison,
        pokemon: @venusaur)

      @form_venusaur_mega = create(:pokemon_form_grass_poison,
        pokemon: @venusaur,
        name: 'Mega Venusaur',
      )

      @bulbasaur_presence = create(:pokemon_presence,
        national_position: 1, 
        form: @form_bulbasaur, pokedex: @kanto,
      )

      @ivysaur_presence = create(:pokemon_presence,
        national_position: 2, 
        form: @form_ivysaur, pokedex: @kanto,
      )

      @venusaur_presence = create(:pokemon_presence,
        national_position: 3, 
        form: @form_venusaur, pokedex: @kanto,
      )

      @venusaur_mega_presence = create(:pokemon_presence,
        national_position: 4, 
        form: @form_venusaur_mega, pokedex: @kanto,
      )
    end

    
    it 'knows how many pokemon presences it contains' do
      expect(@kanto.size).to eq 4
    end
    
    it 'knows how many overall pokemon it contains' do
      expect(@kanto.size_excluding_forms).to eq 3
    end
    
    context 'name searching' do
      it 'can be searched by name' do
        expect(@kanto.search('Bulbasaur')).to eq [@bulbasaur_presence]
      end

      it 'can be searched for a name and return multiple results' do
        expect(@kanto.search('Venusaur')).to eq [
          @venusaur_presence, @venusaur_mega_presence,
        ]
      end

      it 'can be searched case insensetively' do
        expect(@kanto.search('ivysaur')).to eq [@ivysaur_presence]
      end

      it 'returns nil for no results, rather than empty record' do
        expect(@kanto.search('chikorita')).to be_nil
      end
    end

    it 'can be searched for a pokemon' do
      expect(@kanto.search(@bulbasaur)).to eq [@bulbasaur_presence]
    end

    it 'can be searched for a form' do
      expect(@kanto.search(@form_venusaur_mega)).to eq [
        @venusaur_mega_presence,
      ]
    end

    it 'can be searched for a presence' do
      expect(@kanto.search(@bulbasaur_presence)).to eq [@bulbasaur_presence]
    end
  end
end
