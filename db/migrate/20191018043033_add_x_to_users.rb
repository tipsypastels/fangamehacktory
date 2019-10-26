class AddXToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username
    add_column :users, :posts_count, :integer
    add_column :users, :topics_count, :integer
  end
end
