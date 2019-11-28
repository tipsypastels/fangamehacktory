class DefaultStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :polls, :status, 0
  end
end
