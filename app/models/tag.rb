# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tags_on_slug  (slug) UNIQUE
#

class Tag < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :taggings
  has_many :subjects, through: :taggings

  acts_as_api

  api_accessible :public do |api|
    api.add :id
    api.add :name
    api.add :slug
  end
end
