module Subject::Identity
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    friendly_id :title, use: :slugged
    validates :title, presence: true
  end

  def slug=(slug)
    super(no_pokemon_prefix(slug))
  end

  private

  def no_pokemon_prefix(slug)
    slug.sub(/^pokemon[-_ ]/, '') if slug
  end
end