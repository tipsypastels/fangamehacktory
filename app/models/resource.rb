class Resource < ApplicationRecord
  include Subjected

  def self.icon
    :'file-download'
  end

  def default_fields
    {
      introduction: 'TODO',
    }
  end
end
