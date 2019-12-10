# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :string
#  user_id    :integer
#
# Indexes
#
#  index_ratings_on_user_id_and_subject_id  (user_id,subject_id)
#

class Rating < ApplicationRecord
  has_creator counter_cache: false
  belongs_to :subject, counter_cache: true
  
  # counter_culture :subject
  # counter_culture :subject, 
  #   column_name: :overall_rating,
  #   delta_megnitude: ->model { model.magnitude }

  delegate :icon, :magnitude, to: :class
end
