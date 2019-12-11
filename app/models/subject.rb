# == Schema Information
#
# Table name: subjects
#
#  id                     :bigint           not null, primary key
#  color                  :string           default("#1c1c1e")
#  events_count           :integer          default(0)
#  overall_rating         :integer          default(0), not null
#  ratings_count          :integer          default(0), not null
#  slug                   :string
#  status                 :integer          default("draft")
#  subjected_type         :string
#  timelined_events_count :integer          default(0)
#  title                  :string
#  views_count            :integer          default(0)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  subjected_id           :integer
#  team_id                :integer
#  user_id                :integer
#
# Indexes
#
#  index_subjects_on_slug                             (slug) UNIQUE
#  index_subjects_on_subjected_id_and_subjected_type  (subjected_id,subjected_type)
#

class Subject < ApplicationRecord
  include Identity, Status, Scoped, Widgeted, Rated
  include Subscribable, Viewable, Pollable, Notifiable, Taggable
  include Graphics, Terms, Teamwork, Fields, EventTracking

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

  api_accessible :public do |api|
    api.add :id
    api.add :title
    api.add :credit
    api.add :subjected
    api.add :created_at
    api.add :updated_at
    api.add ->s { s.description.to_s }, as: :description
    api.add ->s { s.content.to_s }, as: :content
    api.add :fields
    api.add :avatar_url
    api.add :thumbnail_url
    api.add :creator
    api.add :path
    api.add :api_path
    api.add :status
    api.add :status_icon
    api.add :views_count
    api.add :unread?, as: :unread
    api.add :editable?, as: :editable
    api.add :events_count
    api.add :timelined_events_count
    api.add :latest_event
    api.add :tags
    api.add :ratings_count
    api.add :overall_rating
  end

  def as_json(*)
    as_api_response(:public)
  end

  def path
    subject_path self
  end

  def api_path
    api_subject_path self
  end

  def editable?
    creator == Current.user
  end

  def credit
    [creator.username, team&.title].compact.to_sentence
  end
end
