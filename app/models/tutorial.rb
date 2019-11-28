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
