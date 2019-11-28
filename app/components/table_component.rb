class TableComponent < Components::Component
  element :row, multiple: true do
    attribute :name
    attribute :value
    attribute :css_class

    attribute :from
  end

  def row_from(item)
    @rows << item
  end
end
