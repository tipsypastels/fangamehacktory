class RemoveMemberAsDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :type, 'User'
  end
end
