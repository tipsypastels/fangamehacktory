class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.integer :subject_id

      t.timestamps
    end
  end
end
