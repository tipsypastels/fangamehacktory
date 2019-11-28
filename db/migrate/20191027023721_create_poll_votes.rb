class CreatePollVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_votes do |t|
      t.integer :poll_id
      t.integer :option_id
      t.integer :user_id

      t.timestamps
    end
  end
end
