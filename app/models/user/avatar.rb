module User::Avatar
  extend ActiveSupport::Concern

  included do
    has_one_attached :avatar
    validates :avatar, presence: true
    before_validation :set_default_avatar
  end
  
  DEFAULT_AVATAR_PATH = Rails.root.join('app/assets/images/users/default_avatar.png')

  def set_default_avatar(force: false)
    return if avatar.attached? && !force
    avatar.attach(io: File.open(DEFAULT_AVATAR_PATH), filename: 'avatar.jpg')
  end
end