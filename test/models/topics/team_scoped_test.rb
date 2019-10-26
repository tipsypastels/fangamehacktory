require 'test_helper'

class Topic::TeamScopedTest < ActiveSupport::TestCase
  test "a topic can be scoped to a team" do
    team = Team.new \
      title: 'Duck Team', 
      user_id: users(:dakota).id
    
    topic = Game.new \
      title: 'Gnosis', 
      user_id: users(:dakota).id,
      team: team

    assert_equal team, topic.team
  end

  test "team scoping is optional" do
    topic = Game.new \
      title: 'Gnosis', 
      user_id: users(:dakota).id

    assert topic.valid?
  end

  test "a topic cannot be scoped to a non-team topic" do
    fake_team = Game.new \
      title: 'Duck "Team"',
      user_id: users(:dakota).id

    assert_raises ActiveRecord::AssociationTypeMismatch do
      Game.new \
        title: 'Gnosis',
        user_id: users(:dakota),
        team: fake_team
    end
  end

  test "a team cannot be scoped to a team" do
    team = Team.new \
      title: 'Duck Team', 
      user_id: users(:dakota).id

    child_team = Team.new \
      title: 'Duck Kids',
      user_id: users(:dakota).id,
      team: team

    assert_not child_team.valid?
  end
end