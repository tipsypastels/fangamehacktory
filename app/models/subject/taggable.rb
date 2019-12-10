module Subject::Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings
    has_many :tags, through: :taggings
  end

  def tag_list
    tags.pluck(:name).join(', ')
  end

  def tag_list=(tag_list)
    self.tags = tag_list.split(/\s*,\s*/).map do |name|
      Tag.where(name: name).first_or_create!
    end
  end
end