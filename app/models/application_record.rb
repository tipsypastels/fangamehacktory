class ApplicationRecord < ActiveRecord::Base
  include HasCreator, HasOneAttachedWithDefault

  self.abstract_class = true
end
