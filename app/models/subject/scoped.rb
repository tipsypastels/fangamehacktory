module Subject::Scoped
  extend ActiveSupport::Concern

  included do
    scope :collection, -> {
      includes(:subjected).with_attached_avatar
    }

    scope :on_index, ->page {
      collection
        .ordered_by_status
        .order(updated_at: :desc)
        .paginate(page: page)
    }

    scope :on_profile, -> {
      collection.order(updated_at: :desc)
    }

    scope :of_type, ->type {
      return all unless type.present?
      where(subjected_type: type)
    }
  end

  class_methods do
    def per_page
      30
    end
  end
end