class RenameAdminDiscussionsToAdminMemos < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin_topics, :admin_memos
  end
end
