class AddSubjectedTypeToFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :fields, :topic_id, :subjected_id
    add_column :fields, :subjected_type, :string
    add_index :fields, [:subjected_type, :subjected_id]

    rename_column :polls, :topic_id, :subject_id
    rename_column :posts, :topic_id, :subject_id
    rename_column :subscriptions, :topic_id, :subject_id
    rename_column :users, :topics_count, :subjects_count
    rename_column :views, :topic_id, :subject_id
  end
end
