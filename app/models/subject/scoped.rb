module Subject::Scoped
  extend ActiveSupport::Concern

  included do
    scope :collection, -> {
      includes(:creator, :subjected, :rich_text_description)
        .with_attached_avatar
        .with_attached_thumbnail
    }

    scope :on_index, ->page {
      collection.published_or_own
        .order(pinned: :desc, updated_at: :desc)
        .paginate(page: page)
    }

    scope :on_profile, -> {
      collection.order(updated_at: :desc)
    }

    scope :published_or_own, -> {
      return published unless Current.user

      where <<~SQL.strip.squish, user_id: Current.user.id
        status != 0 
        OR user_id = :user_id
      SQL
    }
  end

  class_methods do
    def per_page
      30
    end
  end
end