class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :species
      t.string :slug

      t.timestamps
    end
    add_index :pokemons, :slug, unique: true
  end
end
