module Subject::Status
  extend ActiveSupport::Concern

  included do
    enum status: {
      draft:     0,
      published: 1,
      archived:  2,
    }
  end
end