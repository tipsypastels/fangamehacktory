class RowComponent < Components::Component
  attribute :css_class
  attribute :width
  attribute :center
  attribute :gutters, default: '6px'

  element :column, multiple: true do
    attribute :width
    attribute :expand
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