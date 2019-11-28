class CreatePollOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_options do |t|
      t.integer :poll_id
      t.string :title

      t.timestamps
    end
  end
end
