class AddNationalPositionToPokemonPresences < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_presences, :national_position, :integer
    rename_column :pokemon_presences, :position, :regional_position
  end
end
