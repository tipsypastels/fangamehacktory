class AddVanillaToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemons, :vanilla, :boolean, default: false
  end
end
