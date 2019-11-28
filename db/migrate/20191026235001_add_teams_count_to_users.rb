class AddTeamsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :teams_count, :integer, default: 0
  end
end
