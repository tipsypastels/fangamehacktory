# == Schema Information
#
# Table name: poll_options
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poll_id    :integer
#

class Poll::Option < ApplicationRecord
  default_scope { includes(:votes) }

  belongs_to :poll
  validates :title, presence: true
  has_many :votes

  acts_as_api
  api_accessible :public do |api|
    api.add :title
  end
end
