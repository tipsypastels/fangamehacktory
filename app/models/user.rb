class User < ApplicationRecord
  include Avatar, Identity, Scoped
  include Types, RoleDisplay

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subjects, dependent: :destroy, inverse_of: 'creator'
  has_many :posts, dependent: :destroy, inverse_of: 'creator'

  has_rich_text :biography
end
