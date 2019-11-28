class RenameGameIdToPokedexId < ActiveRecord::Migration[6.0]
  def change
    rename_column :pokemon_presences, :game_id, :pokedex_id
  end
end
