class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :type
      t.string :title
      t.integer :user_id
      t.integer :status

      t.timestamps
    end
  end
end
