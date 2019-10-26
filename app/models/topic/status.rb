module Topic::Status
  extend ActiveSupport::Concern

  included do
    enum status: {
      draft:     0,
      published: 1,
    }
  end
end