# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  type       :string
#  title      :string
#  user_id    :integer
#  status     :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  color      :string           default("#1c1c1e")
#  pinned     :boolean          default("0")
#  team_id    :integer
#
# Indexes
#
#  index_topics_on_slug  (slug) UNIQUE
#

class Game < Topic
  def self.icon
    :gamepad
  end

  private

  def auto_creatable_fields
    ['introduction', 'story', 'team', 'screenshots', 'progress' => 'widget:progress']
  end
end
