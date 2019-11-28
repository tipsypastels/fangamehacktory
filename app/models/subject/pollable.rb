module Subject::Pollable
  extend ActiveSupport::Concern

  included do
    has_many :polls
    accepts_nested_attributes_for :polls, allow_destroy: true
  end
end