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

    scope :visible_on_index, -> {
      where status: %i|pinned featured published|
    }

    scope :ordered_by_promotion_status, -> {
      visible_on_index.order status: :desc
    }
  end
  
  def status_icon
    StatusIcon.for(status, ICONS[status])
  end
end