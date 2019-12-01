module Subjected
  extend ActiveSupport::Concern

  def self.types
    Subjected::Types::LIST
  end

  class_methods do
    def creatable?
      Current.user
    end

    def css_class
      self.name.downcase
    end

    def human_name
      self.name
    end

    def term
      self.name.downcase
    end

    def viewable_in_principle?
      true
    end
  end

  included do
    has_one :subject, as: :subjected, dependent: :destroy
    validates :subject, presence: true

    delegate :editable?, :draft?, :published?, :archived?, 
      to: :subject

    acts_as_api

    api_accessible :public do |api|
      api.add ->s { s.class.name }, as: :type
      api.add :css_class
      api.add :human_name
      api.add :term
      api.add :icon
      api.add :supported_widget_names
    end
  end

  delegate :css_class, :human_name, :term, :viewable_in_principle?,
    to: :class

  def icon
    self.class.icon
  end

  def viewable?
    (editable? || !draft?) && viewable_in_principle?
  end
end