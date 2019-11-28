class View < ApplicationRecord
  belongs_to :subject, counter_cache: true
  belongs_to :user, optional: true, default: -> { Current.user }
  validates :ip_address, presence: true

  before_validation do
    self.ip_address ||= Current.ip_address
    self.country    ||= Country.find(ip_address)
  end
end
