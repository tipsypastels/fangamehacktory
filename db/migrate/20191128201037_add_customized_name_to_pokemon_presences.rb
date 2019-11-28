class AddCustomizedNameToPokemonPresences < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon_presences, :customized_name, :string
    add_column :pokemon_presences, :customized_type1, :string
    add_column :pokemon_presences, :customized_type2, :string
  end
end
