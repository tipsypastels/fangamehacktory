class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.integer :subject_id
      t.integer :actor_id
      t.string :action
      t.integer :post_id

      t.timestamps
    end
  end
end
