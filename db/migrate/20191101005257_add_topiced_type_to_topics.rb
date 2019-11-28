class AddTopicedTypeToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :topiced_type, :string
    add_column :topics, :topiced_id, :integer
    add_index :topics, [:topiced_id, :topiced_type]
  end
end
