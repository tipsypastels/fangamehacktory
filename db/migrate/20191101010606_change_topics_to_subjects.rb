class ChangeTopicsToSubjects < ActiveRecord::Migration[6.0]
  def change
    rename_table :topics, :subjects
    rename_column :subjects, :topiced_type, :subjected_type
    rename_column :subjects, :topiced_id, :subjected_id
  end
end
