# == Schema Information
#
# Table name: subjects
#
#  id             :bigint           not null, primary key
#  color          :string           default("#1c1c1e")
#  pinned         :boolean          default(FALSE)
#  slug           :string
#  status         :integer          default("draft")
#  subjected_type :string
#  title          :string
#  views_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  subjected_id   :integer
#  team_id        :integer
#  user_id        :integer
#
# Indexes
#
#  index_subjects_on_slug                             (slug) UNIQUE
#  index_subjects_on_subjected_id_and_subjected_type  (subjected_id,subjected_type)
#

class Subject < ApplicationRecord
  include Identity, Status, Scoped, Widgeted
  include Subscribable, Viewable, Pollable
  include Graphics, Terms, Checklisted, Teamwork, Fields

  validates :color,
    presence: true,
    format: {
      with: /\A#[0-9a-f]{6}\z/,
      message: 'must be a hex color code'
    }

  has_creator
  has_rich_text :description
  has_rich_text :content

  belongs_to :subjected, polymorphic: true,
    default: -> { subjected_type.constantize.new(subject: self) }

  accepts_nested_attributes_for :subjected
  delegate :username, to: :creator, prefix: true

  acts_as_api

  api_accessible :list_item do |api|
    api.add :id
    api.add :title
    api.add :description
    api.add :avatar_url, as: :avatarURL
    api.add :thumbnail_url, as: :thumbnailURL
    api.add :color
    api.add :creator_username, as: :creatorUsername
    api.add :creator_path, as: :creatorPath
    api.add :path
    api.add :css_class, as: :cssClass
    api.add :status
  end

  def path
    subject_path self
  end

  def creator_path
    user_path creator
  end

  def editable?
    creator == Current.user
  end

  def credit
    [creator.username, team&.title].compact.to_sentence
  end
end
