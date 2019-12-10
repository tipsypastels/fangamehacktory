class HeadlineComponent < Components::Component
  attribute :title
  validates :title, presence: true

  element :action, multiple: true do
    attribute :name
    attribute :to
    attribute :icon
  end

  alias action_with_keywords action

  def action(name, to, icon)
    action_with_keywords(name: name, to: to, icon: icon)
  end

  def actions_height
    ACTION_HEIGHT * actions.length
  end

  private

  ACTION_HEIGHT = 45
end
