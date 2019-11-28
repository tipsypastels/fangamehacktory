class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.integer :topic_id
      t.string :title

      t.timestamps
    end
  end
end
