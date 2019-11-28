class HeadlineComponent < Components::Component
  attribute :title
  validates :title, presence: true

  element :action, multiple: true do
    attribute :name
    attribute :to
    attribute :active
  end
end
