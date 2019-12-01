class StatusIcon < Struct.new(:slug, :icon)
  class << self
    def for(slug, icon)
      new(slug, icon) if icon
    end

    protected :new
  end

  extend ActsAsApi::Base

  def name
    slug.humanize
  end

  acts_as_api

  api_accessible :public do |api|
    api.add :name
    api.add :slug
    api.add :icon
  end
end