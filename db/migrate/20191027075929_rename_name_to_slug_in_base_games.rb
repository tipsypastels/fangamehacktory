class RenameNameToSlugInBaseGames < ActiveRecord::Migration[6.0]
  def change
    rename_column :base_games, :name, :slug
  end
end
