class CreatePokemonPresences < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_presences do |t|
      t.integer :game_id
      t.integer :form_id
      t.integer :position

      t.timestamps
    end
  end
end
