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
