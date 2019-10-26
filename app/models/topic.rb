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

class Topic < ApplicationRecord
  include Status, Subscribable
  include Graphics, Fields, Types, CreationRestrictions
  include Scoped, TeamScoped

  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, :type, presence: true

  validates :color,
    presence: true,
    format: {
      with: /\A#[0-9a-f]{6}\z/,
      message: 'must be a hex color code'
    }

  belongs_to :creator, 
    class_name: 'User', 
    foreign_key: 'user_id',
    counter_cache: true,
    default: -> { Current.user }

  has_rich_text :description

  def editable?
    creator == Current.user
  end

  def self.term
    self.name.downcase
  end
  delegate :term, to: :class
end
