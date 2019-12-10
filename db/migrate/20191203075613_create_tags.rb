class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.string :color

      t.timestamps
    end
    add_index :tags, :slug, unique: true
  end
end
