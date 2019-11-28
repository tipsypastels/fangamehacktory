class RenameAdminDiscussionsToAdminTopics < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin_discussions, :admin_topics
  end
end
