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

class User < ApplicationRecord
  include Avatar, Identity, Scoped, Notified
  include Types, RoleDisplay

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects, dependent: :destroy, inverse_of: 'creator'
  has_many :posts, dependent: :destroy, inverse_of: 'creator'
  has_many :pokemon, dependent: :destroy, inverse_of: 'creator'

  has_rich_text :biography

  acts_as_api

  api_accessible :public do |api|
    api.add :id
    api.add :username
    api.add :type
    api.add :path
  end

  def path
    user_path self
  end
end
