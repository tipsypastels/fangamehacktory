class Team < ApplicationRecord
  include Subjected
  # has_many :subjects

  delegate :name, :avatar, to: :subject
end