class CreatePokedexes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.integer :game_id
      t.boolean :template, default: false

      t.timestamps
    end
  end
end
