module Subject::Widgeted
  extend ActiveSupport::Concern

  included do
    delegate :supported_widgets, to: :subjected
  end

  def extract_widgets
    content
      .to_s
      .gsub(/{{widget (.+?)}}/) { yield fetch_widget($1) }
      .html_safe
  end

  def fetch_widget(name)
    supported_widgets.fetch(name)
  end
end