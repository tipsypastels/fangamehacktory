module UsersHelper
  def avatar_for(user_or_avatar, opts = {})
    avatar = 
      if user_or_avatar.respond_to? :avatar
        user_or_avatar.avatar
      else
        user_or_avatar
      end

    return unless avatar.present?
    image_tag avatar, opts
  end
end