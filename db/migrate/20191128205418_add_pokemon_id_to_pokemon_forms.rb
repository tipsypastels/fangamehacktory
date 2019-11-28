class AddPokemonIdToPokemonForms < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_forms, :pokemon_id, :integer
  end
end
