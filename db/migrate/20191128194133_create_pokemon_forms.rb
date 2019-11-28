class CreatePokemonForms < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemon_forms do |t|
      t.string :name
      t.string :type1
      t.string :type2
      t.boolean :vanilla, default: :false

      t.timestamps
    end
  end
end
