class RenameLockedToPinned < ActiveRecord::Migration[6.0]
  def change
    rename_column :topics, :locked, :pinned
  end
end
