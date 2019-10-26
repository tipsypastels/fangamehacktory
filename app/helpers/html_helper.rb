module HtmlHelper
  def rp(name, **locals)
    render partial: name, locals: locals
  end

  def rc(name, collection, cached: true, **opts)
    render partial: name, collection: collection, cached: cached, **opts
  end

  def rl(name, **locals, &block)
    render layout: name, locals: locals, &block
  end

  def fancy_form(*args, **opts, &block)
    form_with(*args, **opts.merge({ builder: FancyForm }), &block)
  end

  def fancy_fields_for(*args, **opts, &block)
    fields_for(*args, **opts.merge({ builder: FancyForm }), &block)
  end
end