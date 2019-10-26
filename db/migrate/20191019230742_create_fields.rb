class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.integer :topic_id
      t.string :name

      t.timestamps
    end
  end
end
