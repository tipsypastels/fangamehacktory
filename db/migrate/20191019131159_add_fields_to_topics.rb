class AddFieldsToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :fields, :json
  end
end
