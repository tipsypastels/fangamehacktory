class AddPokemonCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :pokemon_count, :integer
  end
end
