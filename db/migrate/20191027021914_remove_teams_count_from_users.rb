class RemoveTeamsCountFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :teams_count, :integer
  end
end
