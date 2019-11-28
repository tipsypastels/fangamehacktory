# == Schema Information
#
# Table name: announcements
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Announcement < ApplicationRecord
  include Subjected

  def self.icon
    :bullhorn
  end

  def self.creatable?
    Current.admin
  end

  def default_fields
    "Write the content of your announcement here."
  end
end
