module User::Types
  LIST = %w|Member Admin|

  extend ActiveSupport::Concern

  included do
    validates :type, presence: true, inclusion: { in: LIST }
  end

  def admin?
    false
  end
end