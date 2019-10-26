module User::Scoped
  extend ActiveSupport::Concern

  included do
    scope :with_published_topics, -> {
      where('topics_count > 0')
    }

    scope :admins, -> {
      where(type: 'Admin')
    }

    scope :alphabetical, -> {
      order(username: :desc)
    }
  end
end