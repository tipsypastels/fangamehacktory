# == Schema Information
#
# Table name: memos
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Memo < ApplicationRecord
  include Subjected

  def self.icon
    :'users-crown'
  end

  def self.human_name
    'Admin Memo'
  end

  def self.creatable?
    Current.admin
  end

  def viewable_in_principle?
    Current.admin
  end

  def default_fields
    "Write the content of your discussion here. Only admins will see this space."
  end
end
