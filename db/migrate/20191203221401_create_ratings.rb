class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :type
      t.string :subject_id
      t.integer :user_id

      t.timestamps
    end
    add_index :ratings, [:user_id, :subject_id]
  end
end
