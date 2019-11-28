class BoxComponent < Components::Component
  attribute :color, default: :body
  attribute :size, default: :small
  attribute :css_class
  attribute :title
end
