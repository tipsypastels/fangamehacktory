class RemovePokedexFromGame < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :pokedex, :string
    drop_table :fakemons
  end
end
