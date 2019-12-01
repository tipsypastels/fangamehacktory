module User::Notified
  extend ActiveSupport::Concern

  included do
    has_many :notifications do
      def unread?
        where(read: false).present?
      end
    end
  end
end