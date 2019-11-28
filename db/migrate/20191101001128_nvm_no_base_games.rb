class NvmNoBaseGames < ActiveRecord::Migration[6.0]
  def change
    drop_table :base_games
  end
end
