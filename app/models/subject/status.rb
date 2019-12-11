module Subject::Status
  extend ActiveSupport::Concern

  ICONS = {
    draft: :file,
    # published topics have no icon
    archived: :'folder-open',
    featured: :award,
    pinned: :thumbtack,
  }.with_indifferent_access

  included do
    enum status: {
      draft:     0,
      published: 1,
      archived:  2,
      featured:  3,
      pinned:    4,
    }

    scope :your_drafts, -> {
      return none unless Current.user
      draft.where(creator: Current.user)
    }

    scope :visible_on_index, -> {
      where status: %i|pinned featured published|,
            subjected_type: Subjected.types.viewable.names
    }

    scope :ordered_by_status, -> {
      visible_on_index.order status: :desc
    }
  end
  
  def status_icon
    StatusIcon.for(status, ICONS[status])
  end
end