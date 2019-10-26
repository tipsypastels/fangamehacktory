class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string :ancestry

      t.timestamps
    end
    add_index :posts, :ancestry
  end
end
