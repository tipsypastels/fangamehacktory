# == Schema Information
#
# Table name: tutorials
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tutorial < ApplicationRecord
  include Subjected

  def self.icon
    :'graduation-cap'
  end

  def default_fields
    {
      introduction: 'TODO'
    }
  end
end
