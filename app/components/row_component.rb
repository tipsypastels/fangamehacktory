class RowComponent < Components::Component
  attribute :css_class
  attribute :width
  attribute :center
  attribute :gutters, default: '6px'

  validates :center, inclusion: { in: [:both, :horizontal, :vertical] },
                     allow_nil: true

  element :column, multiple: true do
    attribute :width
    attribute :expand
    attribute :css_class
  end

  def centered_css_classes
    return unless center

    if center == :both
      'row--centered-horizontal row--centered-vertical'
    else
      "row--centered-#{center}"
    end    
  end
end