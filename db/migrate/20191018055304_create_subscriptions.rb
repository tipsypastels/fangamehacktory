class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :level

      t.timestamps
    end
  end
end
