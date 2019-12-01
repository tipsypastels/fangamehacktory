module Subject::Viewable
  REPEAT_VIEW_DELAY = 1.minute

  extend ActiveSupport::Concern

  included do
    has_many :views do
      def create!
        super unless viewed_recently?
      end

      def for_current
        if Current.user
          where(user: Current.user)
        else
          where(ip_address: Current.ip_address, user: nil)
        end
      end

      def viewed_recently?
        return false unless Current.user
        where('user_id = ? AND created_at >= ?', Current.user.id, REPEAT_VIEW_DELAY.ago).present?
      end

      def per_day
        group_by_day(:created_at).count
      end

      def per_country
        group(:country).count
      end
    end
  end

  def unread?
    last_view = views.for_current
                     .order(created_at: :desc)
                     .limit(1)
                     .take

    return true unless last_view
    last_view.created_at < updated_at
  end
end