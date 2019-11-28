# == Schema Information
#
# Table name: views
#
#  id         :bigint           not null, primary key
#  country    :string
#  ip_address :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#

class View < ApplicationRecord
  belongs_to :subject, counter_cache: true
  belongs_to :user, optional: true, default: -> { Current.user }
  validates :ip_address, presence: true

  before_validation do
    self.ip_address ||= Current.ip_address
    self.country    ||= Country.find(ip_address)
  end
end
