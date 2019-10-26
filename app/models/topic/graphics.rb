module Topic::Graphics
  extend ActiveSupport::Concern

  included do
    has_one_attached :banner
    has_one_attached :avatar

    validates :banner, :avatar, presence: true

    before_validation :set_default_banner
    before_validation :set_default_avatar
  end

  private

  def default_banner_path
    Rails.root.join("app/assets/images/topics/default_banner_#{term}.png")
  end

  def default_avatar_path
    Rails.root.join("app/assets/images/topics/default_avatar_#{term}.png")
  end

  def set_default_banner(force: false)
    return if banner.attached? && !force
    banner.attach(io: File.open(default_banner_path), filename: 'avatar.jpg')
  end

  def set_default_avatar(force: false)
    return if avatar.attached? && !force
    avatar.attach(io: File.open(default_avatar_path), filename: 'avatar.jpg')
  end
end