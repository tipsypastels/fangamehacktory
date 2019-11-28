class AddTitleToSubjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :title
    remove_column :games, :slug

    add_column :subjects, :title, :string
    add_column :subjects, :slug, :string
    add_index :subjects, :slug, unique: true
  end
end
