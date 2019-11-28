module IconHelper
  def fa(icon, group: :fal, fw: true, **opts)
    klass = "icon #{group} fa-#{icon} #{'fa-fw' if fw} #{opts.delete(:class)}"
    tag.i class: klass, **opts
  end
end