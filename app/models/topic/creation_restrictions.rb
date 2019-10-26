module Topic::CreationRestrictions
  extend ActiveSupport::Concern

  class_methods do
    def can_create?
      Current.user
    end

    def each_creatable_type
      each_type do |type, i|
        next unless type.can_create?
        yield type, i
      end
    end
  end
end