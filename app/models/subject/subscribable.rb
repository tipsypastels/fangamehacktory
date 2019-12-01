module Subject::Subscribable
  extend ActiveSupport::Concern

  included do
    has_many :subscriptions
    has_many :subscribed_users, class_name: 'User', 
      through: :subscriptions, source: :user
      
    accepts_nested_attributes_for :subscriptions
  end
end