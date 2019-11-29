class IndexPokemon < ActiveRecord::Migration[6.0]
  def change
    # Pokemon.destroy_all
    ActiveRecord::Base.connection.execute('delete from pokemons')
    add_index :pokemons, :species, unique: true
    rename_table :pokemons, :pokemon
  end
end
