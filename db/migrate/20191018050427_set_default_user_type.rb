class SetDefaultUserType < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :type, 'Member'
  end
end
