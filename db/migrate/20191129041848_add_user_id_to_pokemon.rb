class AddUserIdToPokemon < ActiveRecord::Migration[6.0]
  def change
    add_column :pokemon, :user_id, :integer
  end
end
