class StickerComponent < Components::Component
  attribute :css_class
  attribute :title

  validates :title, presence: true
end
