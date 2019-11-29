FactoryBot.define do
  factory :pokedex
  factory :pokemon_presence, class: Pokemon::Presence do
    regional_position { national_position }
  end
  factory :pokemon_form, class: Pokemon::Form do
    vanilla { true }
    name { pokemon.species }
    smogon_sprite_slug { name.downcase }

    factory :pokemon_form_grass_poison do
      type1 { 'Grass' }
      type2 { 'Poison' }
    end
  end
  factory :pokemon do
    vanilla { true }
  end
end