class ContextbarComponent < Components::Component
  element :action, multiple: true do
    attribute :name
    attribute :url
    attribute :icon
    attribute :css_class
    attribute :divider

    validates :name, :url,
      absence: true, if: :divider

    validates :name, :url,
      presence: true, unless: :divider

    alias_method :divider?, :divider

    def link(&block)
      css_classes = [
        'contextbar__action', 
        "contextbar__action--#{css_class}",
        css_class
      ].join(' ')

      @view.active_link_to(url, class: css_classes, active: :exact, &block)
    end

    def css_class
      @css_class || name.downcase
    end
  end

  def divider
    action_with_keywords(divider: true)
  end

  alias action_with_keywords action
  private :action_with_keywords

  def action(name, url, **opts)
    action_with_keywords(name: name, url: url, **opts)
  end

  def subject_action(subject_class)
    return unless subject_class.viewable_in_principle?

    name = subject_class.human_name.pluralize
    query_name = subject_class.term
    css_class = subject_class.css_class

    url = @view.root_path(type: query_name)
    icon = @view.fa(subject_class.icon, class: "color-#{css_class}")

    action(name, url, icon: icon, css_class: css_class)
  end

  def subject_actions
    Subjected.types.each(&method(:subject_action))
  end
end
