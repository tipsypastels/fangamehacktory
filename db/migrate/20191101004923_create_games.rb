class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
    add_index :games, :slug, unique: true
  end
end