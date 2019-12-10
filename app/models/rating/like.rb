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

class Rating::Like < Rating
  def self.icon
    :smile
  end

  def self.magnitude
    1
  end
end
