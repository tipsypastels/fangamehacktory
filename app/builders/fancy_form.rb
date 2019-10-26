class FancyForm < ActionView::Helpers::FormBuilder
  def radio_button(name, value, label:, icon:, **opts)
    <<~HTML.html_safe
      <label class="radio-button #{opts.delete(:class)}">
        #{super(name, value, **opts)}

        <div class="radio-button__display">
          <div class="radio-button__icon">
            <i class="fas fa-#{icon}"></i>
          </div>

          <div class="radio-button__text">
            #{label}
          </div>
        </div>
      </label>
    HTML
  end

  def rich_text_area(name, **opts)
    <<~HTML.html_safe
      <div class="rich-text-area-container #{opts.delete(:class)}">
        #{super(name, **opts)}
      </div>
    HTML
  end

  def file_field(name, label, **opts)
    <<~HTML.html_safe
      #{super(name, **opts)}
      
      <span class="link-color">
        #{label}
      </span>
    HTML
  end
end