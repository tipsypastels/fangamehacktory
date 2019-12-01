FactoryBot.define do
  factory :subject do
    subjected_type { 'Game' }
    title { Faker::Game.title }
  end

  factory :view do
    
  end

  factory :event do
    subject_id { 1 }
    actor_id { 1 }
    action { "MyString" }
    post_id { 1 }
  end

  factory :user do
    username { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'camelyo' }
    type { 'User' }
  end

  factory :notification do
    actor_id { 1 }
    user_id { 1 }
    notifiable_type { "MyString" }
    notifiable_id { 1 }
    action { "MyString" }
    read { false }
  end

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