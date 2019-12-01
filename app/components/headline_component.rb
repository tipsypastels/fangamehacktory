class HeadlineComponent < Components::Component
  attribute :title
  validates :title, presence: true

  element :action_group, multiple: true do
    attribute :name 

    element :action, multiple: true do
      attribute :name
      attribute :to
      attribute :icon
      attribute :section
    end

    alias action_with_keywords action
  
    def action(name, to, icon)
      action_with_keywords(name: name, to: to, icon: icon)
    end
  end
end
