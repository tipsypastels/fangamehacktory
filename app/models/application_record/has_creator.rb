module ApplicationRecord::HasCreator
  extend ActiveSupport::Concern

  class_methods do
    def has_creator(counter_cache: true, **opts)
      belongs_to :creator, 
        class_name: 'User', 
        foreign_key: 'user_id',
        counter_cache: counter_cache,
        default: -> { Current.user },
        **opts
    end
  end
end