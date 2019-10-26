class RemoveFieldsFromTopics < ActiveRecord::Migration[6.0]
  def change

    remove_column :topics, :fields, :text
  end
end
