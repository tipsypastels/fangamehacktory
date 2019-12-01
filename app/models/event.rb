# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  action     :string
#  timelined  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  post_id    :integer
#  subject_id :integer
#

class Event < ApplicationRecord
  default_scope { order(created_at: :desc) }

  ACTIONS = {
    'created' => {
      label: "%<actor>s created the %<term>s",
      timelined: true,
      icon: :'plus-circle'
    }
  }

  before_create :set_timelined

  belongs_to :subject
  counter_culture :subject
  counter_culture :subject, column_name: ->model {
    model.timelined? && 'timelined_events_count'
  }

  belongs_to :actor,
    class_name: 'User',
    foreign_key: :actor_id,
    default: -> { Current.user }

  belongs_to :post, optional: true

  validates :action, inclusion: { in: ACTIONS.keys }
  validates :post, presence: true, if: -> { action_info[:post_scoped] }

  acts_as_api

  api_accessible :public do |api|
    api.add :action
    api.add :label
    api.add :icon
    api.add :created_at
  end

  def label
    @label ||= begin
      action_info[:label] % {
        post: truncated_post_content,
        term: subject.term,
        subject: subject.title,
        actor: <<~HTML,
          <span class="color-primary">
            #{actor.username}
          </span>
        HTML
      }
    end.html_safe
  end

  def icon
    action_info[:icon]
  end

  private

  def truncated_post_content
    post&.content.to_s.truncate(20)
  end

  def set_timelined
    self.timelined = action_info[:timelined] || false
  end

  def action_info
    ACTIONS[action]
  end
end
