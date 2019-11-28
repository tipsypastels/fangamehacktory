module Subject::Viewable
  REPEAT_VIEW_DELAY = 30.minutes

  extend ActiveSupport::Concern

  included do
    has_many :views do
      def create!
        super unless viewed_recently?
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
end