# == Schema Information
#
# Table name: subscriptions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#

class Subscription < ApplicationRecord
  belongs_to :subject
  belongs_to :user, default: -> { Current.user }
end
