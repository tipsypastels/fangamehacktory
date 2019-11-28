module User::Scoped
  extend ActiveSupport::Concern

  included do
    scope :with_published_subjects, -> {
      where('subjects_count > 0')
    }

    scope :vips, -> {
      where(type: %w|Admin Vip|)
    }

    scope :admins, -> {
      where(type: 'Admin')
    }

    scope :alphabetical, -> {
      order('UPPER(username) ASC')
    }
  end

  class_methods do
    def per_page
      30
    end
  end
end