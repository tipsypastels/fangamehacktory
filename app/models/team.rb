# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ApplicationRecord
  include Subjected
  # has_many :subjects

  delegate :name, :avatar, to: :subject
end
