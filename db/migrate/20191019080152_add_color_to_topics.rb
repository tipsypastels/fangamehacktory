class AddColorToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :color, :string
  end
end
