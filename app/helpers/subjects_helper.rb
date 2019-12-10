module SubjectsHelper
  def render_content_and_widgets(subject)
    Rails.cache.fetch("#{subject.cache_key_with_version}/widgets") do
      subject.extract_widgets do |widget|
        widget.new(self, subject: subject).render
      end
    end
  end

  def type_and_most_relevant_tags(subject)
    # TODO order by relevance

    [
      tag.span(subject.human_name, class: "color-#{subject.css_class}"),
      *subject.tags.pluck(:name).first(2)
    ].compact
     .join(' / ')
     .html_safe
  end
end
