module Subject::EventTracking
  extend ActiveSupport::Concern

  included do
    has_many :events
    has_many :timelined_events, -> { where(timelined: true) }
    after_create :track_creation_event
  end

  def latest_event
    events.first
  end

  def track_event(action, post: nil)
    events.create! action: action, post: post
  end

  private

  def track_creation_event
    track_event 'created'
  end
end