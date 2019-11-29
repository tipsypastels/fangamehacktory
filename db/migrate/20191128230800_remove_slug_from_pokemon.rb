class RemoveSlugFromPokemon < ActiveRecord::Migration[6.0]
  def change
    remove_column :pokemon, :slug, :string
  end
end
