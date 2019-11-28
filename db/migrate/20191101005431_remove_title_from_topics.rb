class RemoveTitleFromTopics < ActiveRecord::Migration[6.0]
  def change

    remove_column :topics, :title, :string

    remove_column :topics, :slug, :string
  end
end
