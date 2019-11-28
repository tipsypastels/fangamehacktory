class RenameAdminDiscussionsToMemos < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin_memos, :memos
  end
end
