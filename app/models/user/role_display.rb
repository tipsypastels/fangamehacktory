module User::RoleDisplay
  extend ActiveSupport::Concern

  included do
    delegate :role, to: :class
  end

  class_methods do
    attr_reader :role

    def role_display(color, name = self.name, bold: false, italics: false)
      if self == User
        raise ArgumentError, ".role_color must be called on a descendant of User"
      end

      @role = RoleColor.new(color, name, bold, italics)
    end
  end

  RoleColor = Struct.new(:color, :name, :bold, :italics) do
    alias :italics? :italics
    alias :bold? :bold
  end
  private_constant :RoleColor
end