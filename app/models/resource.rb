# == Schema Information
#
# Table name: resources
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Resource < ApplicationRecord
  include Subjected

  def self.icon
    :'file-download'
  end

  def self.suggested_tags
    %w|tileset music sprites script|
  end

  def default_fields
    {
      introduction: 'TODO',
    }
  end
end
