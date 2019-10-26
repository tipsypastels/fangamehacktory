class AddLockedToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :locked, :boolean, default: false
  end
end
