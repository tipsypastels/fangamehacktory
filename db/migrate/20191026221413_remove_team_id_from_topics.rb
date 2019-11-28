class RemoveTeamIdFromTopics < ActiveRecord::Migration[6.0]
  def change

    remove_column :topics, :team_id, :integer
  end
end
