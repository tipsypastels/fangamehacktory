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
