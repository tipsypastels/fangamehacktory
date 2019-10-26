class AddTeamIdToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :team_id, :integer
  end
end
