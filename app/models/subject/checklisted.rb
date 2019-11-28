module Subject::Checklisted
  extend ActiveSupport::Concern

  included do
    has_one :checklist
    accepts_nested_attributes_for :checklist
    
    after_create { Checklist.create! subject_id: id }
    after_update :update_checklist
  end

  def checklist_items(builder)
    unless avatar_changed?
      builder << "Pick an avatar to express your #{term}'s unique personality."
    end

    unless thumbnail_changed?
      builder << "Pick a cool thumbnail that makes your #{term} stand out. Use bright colours!"
    end

    subjected.fields.each do |field|
      if field.blank?
        builder << "Add content to the #{field.name} field or delete it."
      end
    end

    if subjected.respond_to? :checklist_items
      subjected.checklist_items(builder)
    end

    builder
  end

  def update_checklist
    return unless draft?
    checklist.prefill_with_suggestions
  end
end