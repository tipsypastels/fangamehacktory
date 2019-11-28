module SubjectsHelper
  def render_content_and_widgets(subject)
    Rails.cache.fetch("#{subject.cache_key_with_version}/widgets") do
      subject.extract_widgets do |widget|
        widget.new(self, subject: subject).render
      end
    end
  end
end
