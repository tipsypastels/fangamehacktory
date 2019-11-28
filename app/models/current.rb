class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :request_id, :user_agent, :ip_address

  def self.admin
    user if user&.admin?
  end
end