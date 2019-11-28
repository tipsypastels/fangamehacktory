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

  def file_field(name, label = "Upload #{name}", **opts)
    if (current = opts[:current].presence)
      current_url = @template.url_for(current)
    end

    if (crop = opts.delete(:crop))
      @template.react_component 'FileField',
        name: name.to_s.humanize,
        label: label,
        aspect: crop[:aspect],
        current: current_url,
        scope: @object_name,
        buttonClassName: opts[:button_class],
        directUpload: @template.rails_direct_uploads_url
    else
      if current_url
        preview = @template.image_tag current_url, class: 'attr__preview'
      end

      <<~HTML.html_safe
        <div class="attr attr--file">
          <label class="attr--file__picker">
            <div class="attr__title">
              #{name.to_s.humanize}:
            </div>

            #{preview}
            #{super(name, **opts)}
          
            <span class="link-color">
              #{label}
            </span>
          </label>
        </div>
      HTML
    end
  end
end