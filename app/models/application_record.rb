class ApplicationRecord < ActiveRecord::Base
  include HasCreator, HasOneAttachedSmart

  self.abstract_class = true
end
