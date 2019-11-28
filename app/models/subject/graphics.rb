module Subject::Graphics
  extend ActiveSupport::Concern

  included do
    has_one_attached_with_default :thumbnail,
      location: ->{ "subjects/default_thumbnail_#{graphics_file_name}.png" }

    has_one_attached_with_default :avatar,
      location: ->{ "subjects/default_avatar_#{graphics_file_name}.png" }
  end

  def graphics_file_name
    subjected_type.downcase
  end
end