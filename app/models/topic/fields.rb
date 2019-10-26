module Topic::Fields
  extend ActiveSupport::Concern

  included do
    has_many :fields, -> { order position: :asc }, dependent: :destroy
    accepts_nested_attributes_for :fields, allow_destroy: true
    after_create :auto_create_fields
  end

  def show_field_titles?
    fields.size > 1
  end

  def auto_create_fields(force: false)
    return if fields.present? && !force
    
    auto_creatable_fields.each do |field|
      if field.is_a? Hash
        fields.create! \
          name: field.keys.first, 
          content: field.values.first
      else
        fields.create! name: field
      end
    end
  end

  private

  def auto_creatable_fields
    %w|content|
  end
end