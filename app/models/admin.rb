# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  location               :string
#  occupation             :string
#  pokemon_count          :integer
#  posts_count            :integer          default(0)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  subjects_count         :integer          default(0)
#  type                   :string           default("User")
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username)
#

class Admin < Vip
  role_display '#ed8936', bold: true

  def admin?
    true
  end

  def vip?
    true # all admins are VIPs
  end
end
