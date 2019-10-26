class Current < ActiveSupport::CurrentAttributes
  attribute :user

  def self.admin
    user if user.admin?
  end
end