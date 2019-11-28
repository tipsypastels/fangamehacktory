# == Schema Information
#
# Table name: poll_votes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  option_id  :integer
#  poll_id    :integer
#  user_id    :integer
#

class Poll::Vote < ApplicationRecord
  default_scope { includes(:user) }

  belongs_to :poll, default: -> { option.poll }
  belongs_to :option
  belongs_to :user
end
