module User::Types
  LIST = %w|User Admin Vip|

  extend ActiveSupport::Concern

  included do
    validates :type, presence: true, inclusion: { in: LIST }
  end

  def vip?
    false
  end

  def admin?
    false
  end
end