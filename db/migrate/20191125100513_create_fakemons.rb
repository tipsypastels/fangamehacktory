class CreateFakemons < ActiveRecord::Migration[6.0]
  def change
    create_table :fakemons do |t|
      t.integer :game_id
      t.string :slug
      t.string :name
      t.integer :type1
      t.integer :type2

      t.timestamps
    end
    add_index :fakemons, :slug, unique: true
  end
end
