class StickerComponent < Components::Component
  attribute :css_class
  attribute :title
  attribute :icon

  validates :title, presence: true
end
