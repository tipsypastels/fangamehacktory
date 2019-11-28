class AddPokedexToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :pokedex, :string
  end
end
