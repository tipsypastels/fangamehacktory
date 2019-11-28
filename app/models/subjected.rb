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
  end

  included do
    has_one :subject, as: :subjected, dependent: :destroy
    validates :subject, presence: true

    delegate :editable?, :draft?, :published?, :archived?, 
      to: :subject
  end

  delegate :css_class, :human_name, :term, 
    to: :class

  def icon
    self.class.icon
  end

  def viewable?
    (editable? || !draft?) && viewable_in_principle?
  end

  def viewable_in_principle?
    true
  end
end