# == Schema Information
#
# Table name: notifications
#
#  id              :bigint           not null, primary key
#  action          :string           not null
#  notifiable_type :string
#  read            :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  actor_id        :integer
#  notifiable_id   :integer
#  user_id         :integer
#

class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :actor, 
    class_name: 'User',
    foreign_key: :actor_id,
    optional: true

  belongs_to :notifiable,
    polymorphic: true

  validates :action,
    presence: true,
    inclusion: { in: [
      '%<actor>s applauded %<notifiable>s',
    ] }

  delegate :path, to: :notifiable

  def to_sentence
    action % {
      actor: actor.username,
      notifiable: notifiable.notifiable_title,
    }
  end
end
