module Subject::Notifiable
  extend ActiveSupport::Concern

  included do
    has_many :notifications, as: :notifiable do
      def read_all
        update_all(read: true)
      end
    end
  end

  def notifiable_title
    title
  end
end