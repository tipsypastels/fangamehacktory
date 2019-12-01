module Subject::Fields
  extend ActiveSupport::Concern

  included do
    after_create :create_default_fields
    delegate :default_fields, to: :subjected
  end

  def fields
    Rails.cache.fetch("#{cache_key_with_version}/fields") do
      next { '' => content } if default_fields.is_a?(String)
  
      content
        .to_s
        .delete_prefix('<div class="trix-content">')
        .delete_suffix('</div>')
        .split(FIELD_REGEX)
        .reject(&:blank?)
        .each_slice(2)
        .map { |k, v| [k, v] }
        .to_h
    end
  end

  private

  FIELD_REGEX = /(<h1>.+?<\/h1>)/

  def create_default_fields
    content = 
      if default_fields.is_a?(String)
        default_fields
      else
        default_fields.map { |name, value|
          <<~HTML
            <h1>#{name.to_s.titlecase}</h1>
            <p>#{value}</p>
          HTML
        }.join
      end

    update content: content
  end
end