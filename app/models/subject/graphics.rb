module Subject::Graphics
  extend ActiveSupport::Concern

  included do
    has_one_attached_smart(:thumbnail)
    has_one_attached_smart(:avatar) { creator.avatar }
  end
end