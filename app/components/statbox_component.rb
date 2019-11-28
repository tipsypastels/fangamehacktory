class StatboxComponent < Components::Component
  attribute :image
  validates :image, presence: true

  element :stat, multiple: true do
    attribute :name
    attribute :value
    attribute :css_class
  end

  alias stat_with_keywords stat
  private :stat_with_keywords

  def stat(name, value = nil, **opts, &block)
    stat_with_keywords(name: name, value: value, **opts, &block)
  end
end
