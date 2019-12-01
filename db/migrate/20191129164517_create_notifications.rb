class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :actor_id
      t.integer :user_id
      t.string :notifiable_type
      t.integer :notifiable_id
      t.string :action, null: false
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
