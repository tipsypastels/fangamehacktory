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

  def role_styling(user, content = user.username, **opts)
    return content unless user.role

    tag.span content, style: "color: #{user.role.color}; #{'font-style: italic;' if user.role.italics?} #{'font-weight: bold;' if user.role.bold?}", **opts
  end

  def role_badge(user)
    return unless user.role

    tag.div(
      tag.div(
        tag.div(
          user.role.name,
          class: 'badge__inner2',
        ),
        class: 'badge__inner1',
      ),
      class: 'badge',
      style: "--color: #{user.role.color}",
    )
  end

  USER_LIST_SCOPES = {
    'all' => {
      name: 'All Users',
      path: '/users',
      active: /\/users\?(?!scope)/,
    },

    'authors' => {
      name: 'Authors',
      path: '/users?scope=authors',
      active: /\/users\?scope=authors/,
    },

    'vips' => {
      name: 'VIPs',
      path: '/users?scope=vips',
      active: /\/users\?scope=vips/,
    },

    'admins' => {
      name: 'Admins',
      path: '/users?scope=admins',
      active: /\/users\?scope=admins/,
    },
  }
  USER_LIST_SCOPES.default = USER_LIST_SCOPES['all']

  def user_list_scopes
    USER_LIST_SCOPES.map do |key, scope|
      active_link_to scope[:name], scope[:path], 
        class_active: 'hidden-link',
        active: scope[:active]
    end.join(', ').html_safe
  end
end