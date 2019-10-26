module Topic::Types
  extend ActiveSupport::Concern

  LIST = [Announcement, Game, Resource, Tutorial, Team]
  NAMES_LIST = LIST.map(&:name)

  included do
    validates :type, 
      presence: true, 
      inclusion: { in: NAMES_LIST }
  end
  
  class_methods do
    def each_type
      LIST.each_with_index { |t, i| yield t, i }
    end

    def type(type)
      type.constantize
    end
  end
end