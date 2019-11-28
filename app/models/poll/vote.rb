class Poll::Vote < ApplicationRecord
  default_scope { includes(:user) }

  belongs_to :poll, default: -> { option.poll }
  belongs_to :option
  belongs_to :user
end
