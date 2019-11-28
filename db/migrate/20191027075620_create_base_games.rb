class CreateBaseGames < ActiveRecord::Migration[6.0]
  def change
    create_table :base_games do |t|
      t.string :name
      t.integer :game_id
      t.string :version

      t.timestamps
    end
  end
end
