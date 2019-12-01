class SubjectComponent < Components::Component
  attribute :relation
  delegate :to_model, 
           :title, 
           :credit, 
           :avatar, 
           :unread?,
           :status_icon,
           :latest_event,
           :css_class,
           :human_name,
           :icon,
           to: :relation
  
  private

  alias_method :subject, :relation
end
