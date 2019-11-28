class OmnibarComponent < Components::Component
  def link(icon, link, label: nil)
    @view.link_to(@view.fa(icon, group: :fal), link, class: 'omnibar__link', title: label)
  end
end
