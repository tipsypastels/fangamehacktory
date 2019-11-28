class RemoveAncestryFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_index :topics, :ancestry

    remove_column :topics, :ancestry, :string
  end
end
