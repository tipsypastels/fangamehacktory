class AddSmogonSpriteSlugToPokemonForms < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_forms, :smogon_sprite_slug, :string
  end
end
