module Topic::Scoped
  extend ActiveSupport::Concern

  included do
    scope :collection, -> {
      includes(:creator)
        .with_attached_avatar
        .with_attached_banner
    }

    scope :on_index_pinned, -> {
      Topic.collection.published
        .where(pinned: true)
        .order(updated_at: :desc)
    }

    scope :on_index_latest, ->page {
      Topic.collection.published
        .where(pinned: false)
        .order(updated_at: :desc)
        .paginate(page: page)
    }
  end

  class_methods do
    def per_page
      30
    end
  end
end