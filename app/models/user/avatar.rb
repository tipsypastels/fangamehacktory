module User::Avatar
  extend ActiveSupport::Concern

  included do
    if respond_to? :avatars
      validates :avatars, presence: true
    else
      validates :avatar, presence: true
    end
    
    before_validation :set_default_avatar
  end
  
  DEFAULT_AVATAR_PATH = Rails.root.join('app/assets/images/users/default_avatar.png')

  def set_default_avatar(force: false)
    avatar_meth = 
      if respond_to? :avatars
        avatars
      else
        avatar
      end

    return if avatar_meth.attached? && !force
    avatar_meth.attach(io: File.open(DEFAULT_AVATAR_PATH), filename: 'avatar.jpg')
  end
end