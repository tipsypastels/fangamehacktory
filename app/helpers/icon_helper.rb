module IconHelper
  def fa(icon, group: :fas, **opts)
    klass = "#{group} fa-#{icon} #{opts.delete(:class)}"
    tag.i class: klass, **opts
  end
end